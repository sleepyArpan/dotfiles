return {
  handlers = {
    ['textDocument/publishDiagnostics'] = function() end -- Disable diagnostics messages for typescript errors so only emf errors are shown
  }
}
