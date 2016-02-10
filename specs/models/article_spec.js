import Article from 'scripts/models/article';

describe('Article', function() {
  beforeEach(() => {
    this.article = new Article({
      text: 'text',
      name: 'Article',
      comments_count: 0,
      comments: []
    });

    this.saveStub = sinon.stub(this.article, 'save');
  });

  afterEach(() => {
    this.saveStub.restore();
  });

  it('article text is equal to "text"', () => {
    expect(this.article.get('text')).to.equal('text');
  });

  it('article name is equal to "Article"', () => {
    expect(this.article.get('name')).to.equal('Article');
  });

  it('article comments are empty', () => {
    expect(this.article.get('comments')).to.be.empty;
  });

  context('when name is changed', () => {
    it('updates article', () => {
      this.article.set('name', 'Name');
      this.saveStub.should.have.been.calledOnce;
    });
  });
});
