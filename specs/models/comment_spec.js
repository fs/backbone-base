import Comment from 'scripts/models/comment';

describe('Comment', function() {
  beforeEach(function() {
    this.comment = new Comment({
      user: 'User',
      comment: 'Comment'
    });

    this.saveStub = sinon.stub(this.comment, 'save');
  });

  afterEach(function() {
    this.saveStub.restore();
  });

  it('comment user should eq to "User"', function() {
    expect(this.comment.get('user')).to.equal('User');
  });

  it('comment comment should eq to "Comment"', function() {
    expect(this.comment.get('comment')).to.equal('Comment');
  });

  it('should update comment when comment is changed', function() {
    this.comment.set('comment', 'Test');
    this.saveStub.should.have.been.calledOnce;
  });
});
