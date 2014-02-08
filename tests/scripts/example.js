/*
Clones / deep copies an object.

param Object obj
Any object.

return Object
obj--cloned.
*/

var clone;

clone = function(obj) {
  var key, temp;
  if (obj === null || typeof obj !== "object") {
    return obj;
  }
  temp = new Object();
  for (key in obj) {
    temp[key] = clone(obj[key]);
  }
  return temp;
};

describe("addOne Exemplary Tests", function() {
  var AddOne;
  AddOne = void 0;
  /*
  Instead of requiring add-one in each test--making each test async,
  require it in beforeEach, clone it, and sneak it into a global
  so that no test can (permanently) mess with / mutate it.
  */

  beforeEach(function(done) {
    return require(["add-one"], function(_AddOne) {
      AddOne = clone(_AddOne);
      return done();
    });
  });
  it("Should be 2.", function() {
    return chai.assert.equal(AddOne.addOne(1), 2);
  });
  it("Should be 42; Sinon stub.", function() {
    AddOne.addOne = sinon.stub().returns(42);
    return chai.assert.equal(AddOne.addOne(1), 42);
  });
  return it("Should be 2 (again); unstubbed.", function() {
    return chai.assert.equal(AddOne.addOne(1), 2);
  });
});
