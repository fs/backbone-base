import Comment from 'scripts/models/comment';

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

  it('comment user should eq to "User"', () => {
    expect(this.comment.get('user')).to.equal('User');
  });

  it('comment comment should eq to "Comment"', () => {
    expect(this.comment.get('comment')).to.equal('Comment');
  });

  it('should update comment when comment is changed', () => {
    this.comment.set('comment', 'Test');
    this.saveStub.should.have.been.calledOnce;
  });
});
