#compdef deno

autoload -U is-at-least

_deno() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
":: :_deno_commands" \
"*::: :->deno" \
&& ret=0
    case $state in
    (deno)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-command-$line[1]:"
        case $line[1] in
            (bundle)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
':source_file:_files' \
'::out_file:_files' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
':shell:(zsh bash fish powershell elvish)' \
&& ret=0
;;
(eval)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
':code:_files' \
&& ret=0
;;
(fetch)
_arguments "${_arguments_options[@]}" \
'-r+[Reload source code cache (recompile TypeScript)]' \
'--reload=[Reload source code cache (recompile TypeScript)]' \
'--lock=[Check the specified lock file]' \
'--importmap=[Load import map file]' \
'-c+[Load tsconfig.json configuration file]' \
'--config=[Load tsconfig.json configuration file]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--lock-write[Write lock file. Use with --lock.]' \
'--no-remote[Do not resolve remote modules]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
':file:_files' \
&& ret=0
;;
(fmt)
_arguments "${_arguments_options[@]}" \
'--prettierrc=[Specify the configuration file of the prettier.
  auto: Auto detect prettier configuration file in current working dir.
  disable: Disable load configuration file.
  FILE: Load specified prettier configuration file. support .json/.toml/.js/.ts file
 ]' \
'--ignore-path=[Path to a file containing patterns that describe files to ignore.
  auto: Auto detect .pretierignore file in current working dir.
  disable: Disable load .prettierignore file.
  FILE: Load specified prettier ignore file.
 ]' \
'--print-width=[Specify the line length that the printer will wrap on.]' \
'--tab-width=[Specify the number of spaces per indentation-level.]' \
'--quote-props=[Change when properties in objects are quoted.]: :(as-needed consistent preserve)' \
'--arrow-parens=[Include parentheses around a sole arrow function parameter.]: :(avoid always)' \
'--prose-wrap=[How to wrap prose.]: :(always never preserve)' \
'--end-of-line=[Which end of line characters to apply.]: :(auto lf crlf cr)' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--check[Check if the source files are formatted.]' \
'--stdout[Output formated code to stdout]' \
'--use-tabs[Indent lines with tabs instead of spaces.]' \
'--no-semi[Print semicolons at the ends of statements.]' \
'--single-quote[Use single quotes instead of double quotes.]' \
'--jsx-single-quote[Use single quotes instead of double quotes in JSX.]' \
'--jsx-bracket-same-line[Put the > of a multi-line JSX element at the end of the last line
instead of being alone on the next line (does not apply to self closing elements).]' \
'--trailing-comma[Print trailing commas wherever possible when multi-line.]' \
'--no-bracket-spacing[Print spaces between brackets in object literals.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
':files:_files' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'::file:_files' \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
'-d+[Installation directory (defaults to $HOME/.deno/bin)]' \
'--dir=[Installation directory (defaults to $HOME/.deno/bin)]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
':exe_name:_files' \
':cmd:_files' \
&& ret=0
;;
(repl)
_arguments "${_arguments_options[@]}" \
'--v8-flags=[Set V8 command line options. For help: --v8-flags=--help]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
&& ret=0
;;
(run)
_arguments "${_arguments_options[@]}" \
'--importmap=[Load import map file]' \
'-r+[Reload source code cache (recompile TypeScript)]' \
'--reload=[Reload source code cache (recompile TypeScript)]' \
'-c+[Load tsconfig.json configuration file]' \
'--config=[Load tsconfig.json configuration file]' \
'--lock=[Check the specified lock file]' \
'--v8-flags=[Set V8 command line options. For help: --v8-flags=--help]' \
'--allow-read=[Allow file system read access]' \
'--allow-write=[Allow file system write access]' \
'--allow-net=[Allow network access]' \
'--seed=[Seed Math.random()]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--lock-write[Write lock file. Use with --lock.]' \
'--no-remote[Do not resolve remote modules]' \
'--allow-env[Allow environment access]' \
'--allow-run[Allow running subprocesses]' \
'--allow-plugin[Allow loading plugins]' \
'--allow-hrtime[Allow high resolution time measurement]' \
'-A[Allow all permissions]' \
'--allow-all[Allow all permissions]' \
'--cached-only[Require that remote dependencies are already cached]' \
'--current-thread[Use tokio::runtime::current_thread]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'::script_arg -- script args:_files' \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" \
'--importmap=[Load import map file]' \
'-r+[Reload source code cache (recompile TypeScript)]' \
'--reload=[Reload source code cache (recompile TypeScript)]' \
'-c+[Load tsconfig.json configuration file]' \
'--config=[Load tsconfig.json configuration file]' \
'--lock=[Check the specified lock file]' \
'--v8-flags=[Set V8 command line options. For help: --v8-flags=--help]' \
'--allow-read=[Allow file system read access]' \
'--allow-write=[Allow file system write access]' \
'--allow-net=[Allow network access]' \
'--seed=[Seed Math.random()]' \
'-e+[List of file names to exclude from run]' \
'--exclude=[List of file names to exclude from run]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--lock-write[Write lock file. Use with --lock.]' \
'--no-remote[Do not resolve remote modules]' \
'--allow-env[Allow environment access]' \
'--allow-run[Allow running subprocesses]' \
'--allow-plugin[Allow loading plugins]' \
'--allow-hrtime[Allow high resolution time measurement]' \
'-A[Allow all permissions]' \
'--allow-all[Allow all permissions]' \
'--cached-only[Require that remote dependencies are already cached]' \
'--current-thread[Use tokio::runtime::current_thread]' \
'-f[Stop on first error]' \
'--failfast[Stop on first error]' \
'-q[Don'\''t show output from test cases]' \
'--quiet[Don'\''t show output from test cases]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'::files -- List of file names to run:_files' \
&& ret=0
;;
(types)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
&& ret=0
;;
        esac
    ;;
esac
}

(( $+functions[_deno_commands] )) ||
_deno_commands() {
    local commands; commands=(
        "bundle:Bundle module and dependencies into single file" \
"completions:Generate shell completions" \
"eval:Eval script" \
"fetch:Fetch the dependencies" \
"fmt:Format files" \
"info:Show info about cache or info related to source file" \
"install:Install script as executable" \
"repl:Read Eval Print Loop" \
"run:Run a program given a filename or url to the source code" \
"test:Run tests" \
"types:Print runtime TypeScript declarations" \
"help:Prints this message or the help of the given subcommand(s)" \
    )
    _describe -t commands 'deno commands' commands "$@"
}
(( $+functions[_deno__bundle_commands] )) ||
_deno__bundle_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno bundle commands' commands "$@"
}
(( $+functions[_deno__completions_commands] )) ||
_deno__completions_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno completions commands' commands "$@"
}
(( $+functions[_deno__eval_commands] )) ||
_deno__eval_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno eval commands' commands "$@"
}
(( $+functions[_deno__fetch_commands] )) ||
_deno__fetch_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno fetch commands' commands "$@"
}
(( $+functions[_deno__fmt_commands] )) ||
_deno__fmt_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno fmt commands' commands "$@"
}
(( $+functions[_deno__help_commands] )) ||
_deno__help_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno help commands' commands "$@"
}
(( $+functions[_deno__info_commands] )) ||
_deno__info_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno info commands' commands "$@"
}
(( $+functions[_deno__install_commands] )) ||
_deno__install_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno install commands' commands "$@"
}
(( $+functions[_deno__repl_commands] )) ||
_deno__repl_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno repl commands' commands "$@"
}
(( $+functions[_deno__run_commands] )) ||
_deno__run_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno run commands' commands "$@"
}
(( $+functions[_deno__test_commands] )) ||
_deno__test_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno test commands' commands "$@"
}
(( $+functions[_deno__types_commands] )) ||
_deno__types_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno types commands' commands "$@"
}

_deno "$@"