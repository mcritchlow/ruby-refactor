{WorkspaceView} = require 'atom'
RubyRefactor = require '../lib/ruby-refactor'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "RubyRefactor", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('ruby-refactor')

  describe "when the ruby-refactor:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.ruby-refactor')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'ruby-refactor:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.ruby-refactor')).toExist()
        atom.workspaceView.trigger 'ruby-refactor:toggle'
        expect(atom.workspaceView.find('.ruby-refactor')).not.toExist()
