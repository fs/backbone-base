define [
  'models/comment'
], (Comment) ->

  describe 'Comment', ->
    beforeEach ->
      @comment =
        new Comment
          user: 'User'
          comment: 'Comment'
      @save_stub = sinon.stub(@comment, 'save')

    afterEach ->
      @save_stub.restore()

    it 'comment user should eq to "User"', ->
      expect(@comment.get('user')).to.equal 'User'
      return

    it 'comment comment should eq to "Comment"', ->
      expect(@comment.get('comment')).to.equal 'Comment'
      return

    it 'should update comment when comment is changed', ->
      @comment.set('comment', 'Test')
      @save_stub.should.have.been.calledOnce
      return

    return
