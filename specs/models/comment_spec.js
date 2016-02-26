import Comment from 'models/comment';

describe('Comment', function() {
  beforeEach(() => {
    this.comment = new Comment({
      user: 'User',
      comment: 'Comment'
    });

    this.saveStub = sinon.stub(this.comment, 'save');
  });

  afterEach(() => {
    this.saveStub.restore();
  });

  it('comment user is equal to "User"', () => {
    expect(this.comment.get('user')).to.equal('User');
  });

  it('comment comment is equal to "Comment"', () => {
    expect(this.comment.get('comment')).to.equal('Comment');
  });

  context('when comment is changed', () => {
    it('updates comment text', () => {
      this.comment.set('comment', 'Test');
      this.saveStub.should.have.been.calledOnce;
    });
  });
});
