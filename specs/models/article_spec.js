import Article from 'scripts/models/article';

describe('Article', function() {
  beforeEach(function() {
    this.article = new Article({
      text: 'text',
      name: 'Article',
      comments_count: 0,
      comments: []
    });

    this.saveStub = sinon.stub(this.article, 'save');
  });

  afterEach(function() {
    this.saveStub.restore();
  });

  it('article text should eq to "text"', function() {
    expect(this.article.get('text')).to.equal('text');
  });

  it('article name should eq to "Article"', function() {
    expect(this.article.get('name')).to.equal('Article');
  });

  it('article comments should be empty', function() {
    expect(this.article.get('comments')).to.be.empty;
  });

  it('should update article when name is changed', function() {
    this.article.set('name', 'Name');
    this.saveStub.should.have.been.calledOnce;
  });
});
