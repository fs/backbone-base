Article = require('../../app/scripts/models/article')

describe 'Article', ->
  beforeEach ->
    @article = new Article
      text: 'text'
      name: 'Article'
      comments_count: 0
      comments: []

    @save_stub = sinon.stub(@article, 'save')

  afterEach ->
    @save_stub.restore()

  it 'article text should eq to "text"', ->
    expect(@article.get('text')).to.equal 'text'

  it 'article name should eq to "Article"', ->
    expect(@article.get('name')).to.equal 'Article'

  it 'article comments should be empty', ->
    expect(@article.get('comments')).to.be.empty

  it 'should update article when name is changed', ->
    @article.set('name', 'Name')

    @save_stub.should.have.been.calledOnce