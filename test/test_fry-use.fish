function suite_fry-use
    function setup
        stub_var fry_rubies (stub_dir)
        mkdir -p $fry_rubies/ruby-1.9/bin
        mkdir -p $fry_rubies/ruby-2.0/bin
        stub_var fish_user_paths $fry_rubies/ruby-2.0/bin
    end

    function test_empty_arguments
        set -l output (fry-use)

        assert_equal 0 $status
        assert_includes 'usage: fry use <ruby>' $output
        assert_includes 'Available rubies:' $output
        assert_includes (fry-ls) $output
    end

    function test_unknown_ruby
        set -l output (fry-use unknown)

        refute_equal 0 $status
        assert_includes "error: unknown ruby `unknown'" $output
        assert_includes 'Available rubies:' $output
        assert_includes (fry-ls) $output
    end

    function test_ruby_switch
        set -l output (fry-use ruby-1.9)

        assert_equal 0 $status
        assert_includes "Switched to ruby 'ruby-1.9'" $output
        assert_equal $fry_rubies/ruby-1.9/bin $PATH[1]
        refute_includes $fry_rubies/ruby-2.0/bin $PATH
    end

    function test_ruby_switch_with_current
        set -l output (fry-use ruby-2.0)

        assert_equal 0 $status
        assert_empty $output
        assert_equal $fry_rubies/ruby-2.0/bin $PATH[1]
    end

    function test_ruby_switch_with_system
        set -l output (fry-use system)

        assert_equal 0 $status
        assert_includes 'Switched to system ruby' $output
        refute_equal $fry_rubies/ruby-2.0/bin $PATH[1]

        set -l output (fry-use system)
        assert_equal 0 $status
        assert_empty $output
    end

    function test_rubinius_includes_gems_bin_in_path
        mkdir -p $fry_rubies/rbx-2.2.6/bin
        mkdir -p $fry_rubies/rbx-2.2.6/gems/bin

        set output (fry-use rbx-2.2.6)

        refute_includes $fry_rubies/ruby-2.0/bin $PATH
        assert_equal $fry_rubies/rbx-2.2.6/gems/bin $PATH[1]
        assert_equal $fry_rubies/rbx-2.2.6/bin $PATH[2]
    end

    function test_ruby_switch_without_prepend
        stub_var fry_prepend_path 0
        set fish_user_paths (stub_dir)

        set output (fry-use ruby-1.9)

        assert_equal $fry_rubies/ruby-1.9/bin $PATH[2]
    end

    function test_ruby_switch_with_prepend
        stub_var fry_prepend_path 1
        set fish_user_paths (stub_dir)

        set output (fry-use ruby-1.9)

        assert_equal $fry_rubies/ruby-1.9/bin $PATH[1]
    end
end

source (dirname (status -f))/helper.fish
