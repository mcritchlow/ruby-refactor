{View} = require 'atom'

module.exports =
class RubyRefactorView extends View
  @content: ->
    @div class: 'ruby-refactor overlay from-top', =>
      @div "The RubyRefactor package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "ruby-refactor:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "RubyRefactorView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
