%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/"],
        excluded: [~r"/_build/", ~r"/deps/"]
      },
      check_for_updates: true,
      strict: true,
      color: true,
      checks: [
        {Credo.Check.Consistency.ExceptionNames},
        {Credo.Check.Consistency.LineEndings},
        {Credo.Check.Consistency.MultiAliasImportRequireUse},
        {Credo.Check.Consistency.ParameterPatternMatching},
        {Credo.Check.Consistency.SpaceAroundOperators},
        {Credo.Check.Consistency.SpaceInParentheses},
        {Credo.Check.Consistency.TabsOrSpaces},
        {Credo.Check.Design.AliasUsage, priority: :low},
        {Credo.Check.Design.DuplicatedCode, excluded_macros: []},
        {Credo.Check.Design.TagTODO, exit_status: 2},
        {Credo.Check.Design.TagFIXME},
        {Credo.Check.Readability.FunctionNames},
        {Credo.Check.Readability.LargeNumbers},
        {Credo.Check.Readability.MaxLineLength, priority: :low, max_length: 80},
        {Credo.Check.Readability.ModuleAttributeNames},
        {Credo.Check.Readability.ModuleDoc},
        {Credo.Check.Readability.ModuleNames},
        {Credo.Check.Readability.ParenthesesOnZeroArityDefs},
        {Credo.Check.Readability.ParenthesesInCondition},
        {Credo.Check.Readability.PredicateFunctionNames},
        {Credo.Check.Readability.PreferImplicitTry},
        {Credo.Check.Readability.RedundantBlankLines},
        {Credo.Check.Readability.StringSigils},
        {Credo.Check.Readability.TrailingBlankLine},
        {Credo.Check.Readability.TrailingWhiteSpace},
        {Credo.Check.Readability.VariableNames},
        {Credo.Check.Readability.Semicolons},
        {Credo.Check.Readability.SpaceAfterCommas},
        {Credo.Check.Refactor.DoubleBooleanNegation},
        {Credo.Check.Refactor.CondStatements},
        {Credo.Check.Refactor.CyclomaticComplexity},
        {Credo.Check.Refactor.FunctionArity},
        {Credo.Check.Refactor.MatchInCondition},
        {Credo.Check.Refactor.NegatedConditionsInUnless},
        {Credo.Check.Refactor.NegatedConditionsWithElse},
        {Credo.Check.Refactor.Nesting},
        {Credo.Check.Refactor.PipeChainStart, false},
        {Credo.Check.Refactor.UnlessWithElse},
        {Credo.Check.Warning.BoolOperationOnSameValues},
        {Credo.Check.Warning.IExPry},
        {Credo.Check.Warning.IoInspect},
        {Credo.Check.Warning.LazyLogging},
        {Credo.Check.Warning.OperationOnSameValues},
        {Credo.Check.Warning.OperationWithConstantResult},
        {Credo.Check.Warning.UnusedEnumOperation},
        {Credo.Check.Warning.UnusedFileOperation},
        {Credo.Check.Warning.UnusedKeywordOperation},
        {Credo.Check.Warning.UnusedListOperation},
        {Credo.Check.Warning.UnusedPathOperation},
        {Credo.Check.Warning.UnusedRegexOperation},
        {Credo.Check.Warning.UnusedStringOperation},
        {Credo.Check.Warning.UnusedTupleOperation},

        # Controversial and experimental checks (opt-in, just remove `, false`)
        #
        {Credo.Check.Refactor.ABCSize, false},
        {Credo.Check.Refactor.AppendSingleItem, false},
        {Credo.Check.Refactor.VariableRebinding, false},
        {Credo.Check.Warning.MapGetUnsafePass, false},

        # Deprecated checks (these will be deleted after a grace period)
        {Credo.Check.Readability.Specs, false},
        {Credo.Check.Warning.NameRedeclarationByAssignment, false},
        {Credo.Check.Warning.NameRedeclarationByCase, false},
        {Credo.Check.Warning.NameRedeclarationByDef, false},
        {Credo.Check.Warning.NameRedeclarationByFn, false},

        # Custom checks can be created using `mix credo.gen.check`.
      ]
    }
  ]
}
