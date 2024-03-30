require("neotest").setup({
  adapters = {
    require('neotest-java') {
      command = 'java',
      use_lsp = true,
      custom_test_method_names = {},
      ignore_wrapper = false,
    },
    require('neotest-dart') {
      command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
      -- Change it to `fvm flutter` if using FVM
      -- change it to `dart` for Dart only tests
      use_lsp = true, -- When set Flutter outline information is used when constructing test name.
      -- Useful when using custom test names with @isTest annotation
      custom_test_method_names = {},
    },
  },
})
