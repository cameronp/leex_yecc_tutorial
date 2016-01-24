defmodule LeexYeccTutorial do
 def lex(s) when is_binary(s), do: s |> to_char_list |> lex
 def lex(s) do
   {:ok, tokens, _} = :number_lexer.string(s)
   tokens
 end

 def parse(s) when is_binary(s), do: s |> to_char_list |> parse
 def parse(s) do
   {:ok, tokens, _} = :number_lexer.string(s)
   :number_parser.parse(tokens) |> complete_parse
 end

 def complete_parse({:ok, ast}), do: ast
 def complete_parse({:error, {line, _, message}}), do: {:error, ["Line: #{line} "] ++ message |> Enum.join}
end
