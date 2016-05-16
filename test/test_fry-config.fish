function suite_fry-config
    function setup
        stub_var fry_auto_switch 0
        stub_var fry_prepend_path 0
        stub_var fry_rubies (stub_dir)
        stub_var fry_installer installer
    end

    function test_empty_arguments
        assert (fry-config)
        assert_includes (fry-config help) (fry-config)
    end

    function test_help
        set -l auto_output (fry-config auto)
        set -l prepend_output (fry-config prepend)
        set -l path_output (fry-config path)
        set -l installer_output (fry-config installer)

        for arg in help --help -h
            set -l output (fry-config $arg)

            assert_equal 0 $status
            assert_includes 'usage: fry config <name> [<value>]' $output
            assert_includes 'Available configuration:' $output
            assert_match $auto_output $output
            assert_match $prepend_output $output
            assert_match $path_output $output
            assert_match $installer_output $output

            assert_includes 'Current configuration:' $output
            assert_includes '    Auto-Switch: off' $output
            assert_includes '    Prepend Path: off' $output
            assert_includes "    Path: $fry_rubies" $output
            assert_includes "    Installer: $fry_installer" $output
        end
    end

    function test_unknown_command
        set -l output (fry-config unknown)
        assert_equal 1 $status
        assert_includes 'usage: fry config <name> [<value>]' $output
    end

    function test_path_config
        set -l original_path $fry_rubies
        set -l other_path stub_dir

        for command in path rubies
            assert_equal "Path: $original_path" (fry-config $command)
            assert_equal "Path: $other_path" (fry-config $command $other_path)
            assert_equal $fry_rubies $other_path
            set fry_rubies $original_path
        end
    end

    function test_auto_switch_config
        assert_equal 'Auto-Switch: off' (fry-config auto)

        assert_equal 'Auto-Switch: on' (fry-config auto on)
        assert_equal $fry_auto_switch 1

        assert_equal 'Auto-Switch: off' (fry-config auto off)
        assert_equal $fry_auto_switch 0

        assert_equal 'Auto-Switch: on' (fry-config auto 1)
        assert_equal $fry_auto_switch 1

        assert_equal 'Auto-Switch: off' (fry-config auto 0)
        assert_equal $fry_auto_switch 0
    end

    function test_prepend_path_config
        assert_equal 'Prepend Path: off' (fry-config prepend)

        assert_equal 'Prepend Path: on' (fry-config prepend on)
        assert_equal $fry_prepend_path 1

        assert_equal 'Prepend Path: off' (fry-config prepend off)
        assert_equal $fry_prepend_path 0

        assert_equal 'Prepend Path: on' (fry-config prepend 1)
        assert_equal $fry_prepend_path 1

        assert_equal 'Prepend Path: off' (fry-config prepend 0)
        assert_equal $fry_prepend_path 0
    end

    function test_installer_config
        assert_equal 'Installer: installer' (fry-config installer)
        assert_equal 'Installer: new_installer' (fry-config installer new_installer)
        assert_equal $fry_installer new_installer
    end
end

source (dirname (status -f))/helper.fish
