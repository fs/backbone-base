define [
  'models/article'
], (Article) ->

  describe 'Article', ->
    beforeEach ->
      @article =
        new Article
          text: 'text'
          name: 'Article'
          comments_count: 0
          comments: []
      @save_stub = sinon.stub(@article, 'save')

    afterEach ->
      @save_stub.restore()

    it 'article text should eq to "text"', ->
      expect(@article.get('text')).to.equal 'text'
      return

    it 'article name should eq to "Article"', ->
      expect(@article.get('name')).to.equal 'Article'
      return

    it 'article comments should be empty', ->
      expect(@article.get('comments')).to.be.empty
      return

    it 'should update article when name is changed', ->
      @article.set('name', 'Name')
      @save_stub.should.have.been.calledOnce
      return

    return
