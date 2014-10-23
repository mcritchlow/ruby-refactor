RubyRefactorView = require './ruby-refactor-view'

module.exports =
  rubyRefactorView: null

  activate: (state) ->
    @rubyRefactorView = new RubyRefactorView(state.rubyRefactorViewState)

  deactivate: ->
    @rubyRefactorView.destroy()

  serialize: ->
    rubyRefactorViewState: @rubyRefactorView.serialize()
