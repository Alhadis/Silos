    LOG("nrt: " NRT_TEST_BUILD_MICROARCHITECTURE_PADDING ": " NRT_TEST_BUILD_TYPE_PADDING ": " NRT_TEST_NAME_PADDING ": ", nrt_build_microarchitecture(), nrt_build_type(), "file_move");

    directory_create("nrt_tmp");
    assert(file_move("nrt_tmp", "nrt_tmp2"));
    directory_delete("nrt_tmp2");

    close_handle(file_create("nrt_tmp", false, false));
    assert(file_move("nrt_tmp", "nrt_tmp2"));
    file_delete("nrt_tmp2");

    LOG("passed, benchmarking... ");

    directory_create("nrt_tmp");
    close_handle(file_create("nrt_tmpfile", false, false));

    unsigned long long rename_start = time_utc();

    for(unsigned long long i = 0; i < 4; ++i)
    {
        rename("nrt_tmp", "nrt_tmp2");
        rename("nrt_tmp2", "nrt_tmp");

        rename("nrt_tmpfile", "nrt_tmpfile2");
        rename("nrt_tmpfile2", "nrt_tmpfile");
    }

    unsigned long long rename_stop = time_utc();
    unsigned long long file_move_start = time_utc();

    for(unsigned long long i = 0; i < 4; ++i)
    {
        file_move("nrt_tmp", "nrt_tmp2");
        file_move("nrt_tmp2", "nrt_tmp");

        file_move("nrt_tmpfile", "nrt_tmpfile2");
        file_move("nrt_tmpfile2", "nrt_tmpfile");
    }

    unsigned long long file_move_stop = time_utc();

    directory_delete("nrt_tmp");
    file_delete("nrt_tmpfile");

    double rename_time = 1.0 + (rename_stop - rename_start);
    double file_move_time = 1.0 + (file_move_stop - file_move_start);

    total_crt_time += rename_time;
    total_time += file_move_time;

    LOG("done: %6.1f%% %s: %4.1f ms vs %4.1f ms for rename\n", lowest_float(((file_move_time < rename_time) ? ((rename_time - file_move_time) / file_move_time) : ((file_move_time - rename_time) / rename_time)) * 100.0, 9999.99), (file_move_time < rename_time) ? "faster" : "slower", file_move_time * 0.0001, rename_time * 0.0001);
