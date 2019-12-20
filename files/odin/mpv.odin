package mpv

foreign import mpv_lib "libmpv.dll.a"

// This file binds functions, structs and enums found
// All comments from the original c/c++ api headers have been copied without changes.

// Names of functions, variables and constant have been switched to the Odin naming
// conventions. Macros have been changed into constants and procs. The mpv_ prefixes
// have been removed as well as redundant prefixes in enums. In some cases a trailing
// underscore is added for reserved names or removed for names that are reserved in c/c++
// but not in odin.

/* Copyright (C) 2017 the mpv developers
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/*
 * Note: the client API is licensed under ISC (see above) to enable
 * other wrappers outside of mpv. But keep in mind that the
 * mpv core is by default still GPLv2+ - unless built with
 * --enable-lgpl, which makes it LGPLv2+.
 */

//
// client.h
//

/**
 * Mechanisms provided by this API
 * -------------------------------
 *
 * This API provides general control over mpv playback. It does not give you
 * direct access to individual components of the player, only the whole thing.
 * It's somewhat equivalent to MPlayer's slave mode. You can send commands,
 * retrieve or set playback status or settings with properties, and receive
 * events.
 *
 * The API can be used in two ways:
 * 1) Internally in mpv, to provide additional features to the command line
 *    player. Lua scripting uses this. (Currently there is no plugin API to
 *    get a client API handle in external user code. It has to be a fixed
 *    part of the player at compilation time.)
 * 2) Using mpv as a library with mpv_create(). This basically allows embedding
 *    mpv in other applications.
 *
 * Documentation
 * -------------
 *
 * The libmpv C API is documented directly in this header. Note that most
 * actual interaction with this player is done through
 * options/commands/properties, which can be accessed through this API.
 * Essentially everything is done with them, including loading a file,
 * retrieving playback progress, and so on.
 *
 * These are documented elsewhere:
 *      * http://mpv.io/manual/master/#options
 *      * http://mpv.io/manual/master/#list-of-input-commands
 *      * http://mpv.io/manual/master/#properties
 *
 * You can also look at the examples here:
 *      * https://github.com/mpv-player/mpv-examples/tree/master/libmpv
 *
 * Event loop
 * ----------
 *
 * In general, the API user should run an event loop in order to receive events.
 * This event loop should call mpv_wait_event(), which will return once a new
 * mpv client API is available. It is also possible to integrate client API
 * usage in other event loops (e.g. GUI toolkits) with the
 * mpv_set_wakeup_callback() function, and then polling for events by calling
 * mpv_wait_event() with a 0 timeout.
 *
 * Note that the event loop is detached from the actual player. Not calling
 * mpv_wait_event() will not stop playback. It will eventually congest the
 * event queue of your API handle, though.
 *
 * Synchronous vs. asynchronous calls
 * ----------------------------------
 *
 * The API allows both synchronous and asynchronous calls. Synchronous calls
 * have to wait until the playback core is ready, which currently can take
 * an unbounded time (e.g. if network is slow or unresponsive). Asynchronous
 * calls just queue operations as requests, and return the result of the
 * operation as events.
 *
 * Asynchronous calls
 * ------------------
 *
 * The client API includes asynchronous functions. These allow you to send
 * requests instantly, and get replies as events at a later point. The
 * requests are made with functions carrying the _async suffix, and replies
 * are returned by mpv_wait_event() (interleaved with the normal event stream).
 *
 * A 64 bit userdata value is used to allow the user to associate requests
 * with replies. The value is passed as reply_userdata parameter to the request
 * function. The reply to the request will have the reply
 * mpv_event->reply_userdata field set to the same value as the
 * reply_userdata parameter of the corresponding request.
 *
 * This userdata value is arbitrary and is never interpreted by the API. Note
 * that the userdata value 0 is also allowed, but then the client must be
 * careful not accidentally interpret the mpv_event->reply_userdata if an
 * event is not a reply. (For non-replies, this field is set to 0.)
 *
 * Asynchronous calls may be reordered in arbitrarily with other synchronous
 * and asynchronous calls. If you want a guaranteed order, you need to wait
 * until asynchronous calls report completion before doing the next call.
 *
 * Multithreading
 * --------------
 *
 * The client API is generally fully thread-safe, unless otherwise noted.
 * Currently, there is no real advantage in using more than 1 thread to access
 * the client API, since everything is serialized through a single lock in the
 * playback core.
 *
 * Basic environment requirements
 * ------------------------------
 *
 * This documents basic requirements on the C environment. This is especially
 * important if mpv is used as library with mpv_create().
 *
 * - The LC_NUMERIC locale category must be set to "C". If your program calls
 *   setlocale(), be sure not to use LC_ALL, or if you do, reset LC_NUMERIC
 *   to its sane default: setlocale(LC_NUMERIC, "C").
 * - If a X11 based VO is used, mpv will set the xlib error handler. This error
 *   handler is process-wide, and there's no proper way to share it with other
 *   xlib users within the same process. This might confuse GUI toolkits.
 * - mpv uses some other libraries that are not library-safe, such as Fribidi
 *   (used through libass), ALSA, FFmpeg, and possibly more.
 * - The FPU precision must be set at least to double precision.
 * - On Windows, mpv will call timeBeginPeriod(1).
 * - On memory exhaustion, mpv will kill the process.
 * - In certain cases, mpv may start sub processes (such as with the ytdl
 *   wrapper script).
 * - Using UNIX IPC (off by default) will override the SIGPIPE signal handler,
 *   and set it to SIG_IGN.
 *
 * Encoding of filenames
 * ---------------------
 *
 * mpv uses UTF-8 everywhere.
 *
 * On some platforms (like Linux), filenames actually do not have to be UTF-8;
 * for this reason libmpv supports non-UTF-8 strings. libmpv uses what the
 * kernel uses and does not recode filenames. At least on Linux, passing a
 * string to libmpv is like passing a string to the fopen() function.
 *
 * On Windows, filenames are always UTF-8, libmpv converts between UTF-8 and
 * UTF-16 when using win32 API functions. libmpv never uses or accepts
 * filenames in the local 8 bit encoding. It does not use fopen() either;
 * it uses _wfopen().
 *
 * On OS X, filenames and other strings taken/returned by libmpv can have
 * inconsistent unicode normalization. This can sometimes lead to problems.
 * You have to hope for the best.
 *
 * Also see the remarks for MPV_FORMAT_STRING.
 *
 * Embedding the video window
 * --------------------------
 *
 * Using the opengl-cb API (in opengl_cb.h) is recommended. This API requires
 * you to create and maintain an OpenGL context, to which you can render
 * video using a specific API call. This API does not include keyboard or mouse
 * input directly.
 *
 * There is an older way to embed the native mpv window into your own. You have
 * to get the raw window handle, and set it as "wid" option. This works on X11,
 * win32, and OSX only. It's much easier to use than the opengl-cb API, but
 * also has various problems.
 *
 * Also see client API examples and the mpv manpage. There is an extensive
 * discussion here:
 * https://github.com/mpv-player/mpv-examples/tree/master/libmpv#methods-of-embedding-the-video-window
 *
 * Compatibility
 * -------------
 *
 * mpv development doesn't stand still, and changes to mpv internals as well as
 * to its interface can cause compatibility issues to client API users.
 *
 * The API is versioned (see MPV_CLIENT_API_VERSION), and changes to it are
 * documented in DOCS/client-api-changes.rst. The C API itself will probably
 * remain compatible for a long time, but the functionality exposed by it
 * could change more rapidly. For example, it's possible that options are
 * renamed, or change the set of allowed values.
 *
 * Defensive programming should be used to potentially deal with the fact that
 * options, commands, and properties could disappear, change their value range,
 * or change the underlying datatypes. It might be a good idea to prefer
 * MPV_FORMAT_STRING over other types to decouple your code from potential
 * mpv changes.
 *
 * Future changes
 * --------------
 *
 * This are the planned changes that will most likely be done on the next major
 * bump of the library:
 *
 *  - remove all symbols and include files that are marked as deprecated
 *  - reassign enum numerical values to remove gaps
 *  - remove the mpv_opengl_init_params.extra_exts field
 *  - change the type of mpv_event_end_file.reason
 *  - disabling all events by default
 */

/**
 * The version is incremented on each API change. The 16 lower bits form the
 * minor version number, and the 16 higher bits the major version number. If
 * the API becomes incompatible to previous versions, the major version
 * number is incremented. This affects only C part, and not properties and
 * options.
 *
 * Every API bump is described in DOCS/client-api-changes.rst
 *
 * You can use MPV_MAKE_VERSION() and compare the result with integer
 * relational operators (<, >, <=, >=).
 */

make_version :: proc(major, minor: u32) -> u32 do return (major << 16) | minor;
CLIENT_API_VERSION := make_version(1, 103);

/**
 * The API user is allowed to "-define MPV_ENABLE_DEPRECATED 0" before
 * including any libmpv headers. Then deprecated symbols will be excluded
 * from the headers. (Of course, deprecated properties and commands and
 * other functionality will still work.)
 */
when !#defined(MPV_ENABLE_DEPRECATED) {
    MPV_ENABLE_DEPRECATED :: true;
}

@(default_calling_convention="c", link_prefix="mpv_")
foreign mpv_lib {
    /**
     * Return the MPV_CLIENT_API_VERSION the mpv source has been compiled with.
     */
    client_api_version :: proc() -> u32 ---;
}

/**
 * Client context used by the client API. Every client has its own private
 * handle.
 */
Handle :: struct{};

/**
 * List of error codes than can be returned by API functions. 0 and positive
 * return values always mean success, negative values are always errors.
 */
Error :: enum i32 {
    /**
     * No error happened (used to signal successful operation).
     * Keep in mind that many API functions returning error codes can also
     * return positive values, which also indicate success. API users can
     * hardcode the fact that ">= 0" means success.
     */
    Success           = 0,
    /**
     * The event ringbuffer is full. This means the client is choked, and can't
     * receive any events. This can happen when too many asynchronous requests
     * have been made, but not answered. Probably never happens in practice,
     * unless the mpv core is frozen for some reason, and the client keeps
     * making asynchronous requests. (Bugs in the client API implementation
     * could also trigger this, e.g. if events become "lost".)
     */
    Event_Queue_Full  = -1,
    /**
     * Memory allocation failed.
     */
    Nomem             = -2,
    /**
     * The mpv core wasn't configured and initialized yet. See the notes in
     * mpv_create().
     */
    Uninitialized     = -3,
    /**
     * Generic catch-all error if a parameter is set to an invalid or
     * unsupported value. This is used if there is no better error code.
     */
    Invalid_Parameter = -4,
    /**
     * Trying to set an option that doesn't exist.
     */
    Option_Not_Found  = -5,
    /**
     * Trying to set an option using an unsupported MPV_FORMAT.
     */
    Option_Format     = -6,
    /**
     * Setting the option failed. Typically this happens if the provided option
     * value could not be parsed.
     */
    Option_Error      = -7,
    /**
     * The accessed property doesn't exist.
     */
    Property_Not_Found = -8,
    /**
     * Trying to set or get a property using an unsupported MPV_FORMAT.
     */
    Property_Format   = -9,
    /**
     * The property exists, but is not available. This usually happens when the
     * associated subsystem is not active, e.g. querying audio parameters while
     * audio is disabled.
     */
    Property_Unavailable = -10,
    /**
     * Error setting or getting a property.
     */
    Property_Error    = -11,
    /**
     * General error when running a command with mpv_command and similar.
     */
    Command           = -12,
    /**
     * Generic error on loading (usually used with mpv_event_end_file.error).
     */
    Loading_Failed    = -13,
    /**
     * Initializing the audio output failed.
     */
    AO_Init_Failed    = -14,
    /**
     * Initializing the video output failed.
     */
    VO_Init_Failed    = -15,
    /**
     * There was no audio or video data to play. This also happens if the
     * file was recognized, but did not contain any audio or video streams,
     * or no streams were selected.
     */
    Nothing_To_Play   = -16,
    /**
     * When trying to load the file, the file format could not be determined,
     * or the file was too broken to open it.
     */
    Unknown_Format    = -17,
    /**
     * Generic error for signaling that certain system requirements are not
     * fulfilled.
     */
    Unsupported       = -18,
    /**
     * The API function which was called is a stub only.
     */
    Not_Implemented   = -19,
    /**
     * Unspecified error.
     */
    Generic           = -20
}

@(default_calling_convention="c", link_prefix="mpv_")
foreign mpv_lib {
    /**
     * Return a string describing the error. For unknown errors, the string
     * "unknown error" is returned.
     *
     * @param error error number, see enum mpv_error
     * @return A static string describing the error. The string is completely
     *         static, i.e. doesn't need to be deallocated, and is valid forever.
     */
    error_string :: proc(error: Error) -> cstring ---;
}

@(default_calling_convention="c")
foreign mpv_lib {
    /**
     * General function to deallocate memory returned by some of the API functions.
     * Call this only if it's explicitly documented as allowed. Calling this on
     * mpv memory not owned by the caller will lead to undefined behavior.
     *
     * @param data A valid pointer returned by the API, or NULL.
     */
    mpv_free :: proc(data: rawptr) ---;
}

@(default_calling_convention="c", link_prefix="mpv_")
foreign mpv_lib {
    /**
     * Return the name of this client handle. Every client has its own unique
     * name, which is mostly used for user interface purposes.
     *
     * @return The client name. The string is read-only and is valid until the
     *         mpv_handle is destroyed.
     */
    client_name :: proc(ctx: ^Handle) -> cstring ---;

    /**
     * Create a new mpv instance and an associated client API handle to control
     * the mpv instance. This instance is in a pre-initialized state,
     * and needs to be initialized to be actually used with most other API
     * functions.
     *
     * Some API functions will return MPV_ERROR_UNINITIALIZED in the uninitialized
     * state. You can call mpv_set_property() (or mpv_set_property_string() and
     * other variants, and before mpv 0.21.0 mpv_set_option() etc.) to set initial
     * options. After this, call mpv_initialize() to start the player, and then use
     * e.g. mpv_command() to start playback of a file.
     *
     * The point of separating handle creation and actual initialization is that
     * you can configure things which can't be changed during runtime.
     *
     * Unlike the command line player, this will have initial settings suitable
     * for embedding in applications. The following settings are different:
     * - stdin/stdout/stderr and the terminal will never be accessed. This is
     *   equivalent to setting the --no-terminal option.
     *   (Technically, this also suppresses C signal handling.)
     * - No config files will be loaded. This is roughly equivalent to using
     *   --config=no. Since libmpv 1.15, you can actually re-enable this option,
     *   which will make libmpv load config files during mpv_initialize(). If you
     *   do this, you are strongly encouraged to set the "config-dir" option too.
     *   (Otherwise it will load the mpv command line player's config.)
     *   For example:
     *      mpv_set_option_string(mpv, "config-dir", "/my/path"); // set config root
     *      mpv_set_option_string(mpv, "config", "yes"); // enable config loading
     *      (call mpv_initialize() _after_ this)
     * - Idle mode is enabled, which means the playback core will enter idle mode
     *   if there are no more files to play on the internal playlist, instead of
     *   exiting. This is equivalent to the --idle option.
     * - Disable parts of input handling.
     * - Most of the different settings can be viewed with the command line player
     *   by running "mpv --show-profile=libmpv".
     *
     * All this assumes that API users want a mpv instance that is strictly
     * isolated from the command line player's configuration, user settings, and
     * so on. You can re-enable disabled features by setting the appropriate
     * options.
     *
     * The mpv command line parser is not available through this API, but you can
     * set individual options with mpv_set_property(). Files for playback must be
     * loaded with mpv_command() or others.
     *
     * Note that you should avoid doing concurrent accesses on the uninitialized
     * client handle. (Whether concurrent access is definitely allowed or not has
     * yet to be decided.)
     *
     * @return a new mpv client API handle. Returns NULL on error. Currently, this
     *         can happen in the following situations:
     *         - out of memory
     *         - LC_NUMERIC is not set to "C" (see general remarks)
     */
    create :: proc() -> ^Handle ---;

    /**
     * Initialize an uninitialized mpv instance. If the mpv instance is already
     * running, an error is retuned.
     *
     * This function needs to be called to make full use of the client API if the
     * client API handle was created with mpv_create().
     *
     * Only the following options require to be set _before_ mpv_initialize():
     *      - options which are only read at initialization time:
     *        - config
     *        - config-dir
     *        - input-conf
     *        - load-scripts
     *        - script
     *        - player-operation-mode
     *        - input-app-events (OSX)
     *      - all encoding mode options
     *
     * @return error code
     */
    initialize :: proc(ctx: ^Handle) -> i32 ---;

    /**
     * Disconnect and destroy the mpv_handle. ctx will be deallocated with this
     * API call.
     *
     * If the last mpv_handle is detached, the core player is destroyed. In
     * addition, if there are only weak mpv_handles (such as created by
     * mpv_create_weak_client() or internal scripts), these mpv_handles will
     * be sent MPV_EVENT_SHUTDOWN. This function may block until these clients
     * have responded to the shutdown event, and the core is finally destroyed.
     */
    destroy :: proc(ctx: ^Handle) ---;

    when #defined(MPV_ENABLE_DEPRECATED) {
    /**
     * @deprecated use mpv_destroy(), which has exactly the same semantics (the
     * deprecation is a mere rename)
     *
     * Since mpv client API version 1.29:
     *  If the last mpv_handle is detached, the core player is destroyed. In
     *  addition, if there are only weak mpv_handles (such as created by
     *  mpv_create_weak_client() or internal scripts), these mpv_handles will
     *  be sent MPV_EVENT_SHUTDOWN. This function may block until these clients
     *  have responded to the shutdown event, and the core is finally destroyed.
     *
     * Before mpv client API version 1.29:
     *  This left the player running. If you want to be sure that the
     *  player is terminated, send a "quit" command, and wait until the
     *  MPV_EVENT_SHUTDOWN event is received, or use mpv_terminate_destroy().
     */
    detach_destroy :: proc(ctx: ^Handle) ---;
    }

    /**
     * Similar to mpv_destroy(), but brings the player and all clients down
     * as well, and waits until all of them are destroyed. This function blocks. The
     * advantage over mpv_destroy() is that while mpv_destroy() merely
     * detaches the client handle from the player, this function quits the player,
     * waits until all other clients are destroyed (i.e. all mpv_handles are
     * detached), and also waits for the final termination of the player.
     *
     * Since mpv_destroy() is called somewhere on the way, it's not safe to
     * call other functions concurrently on the same context.
     *
     * Since mpv client API version 1.29:
     *  The first call on any mpv_handle will block until the core is destroyed.
     *  This means it will wait until other mpv_handle have been destroyed. If you
     *  want asynchronous destruction, just run the "quit" command, and then react
     *  to the MPV_EVENT_SHUTDOWN event.
     *  If another mpv_handle already called mpv_terminate_destroy(), this call will
     *  not actually block. It will destroy the mpv_handle, and exit immediately,
     *  while other mpv_handles might still be uninitializing.
     *
     * Before mpv client API version 1.29:
     *  If this is called on a mpv_handle that was not created with mpv_create(),
     *  this function will merely send a quit command and then call
     *  mpv_destroy(), without waiting for the actual shutdown.
     */
    terminate_destroy :: proc(ctx: ^Handle) ---;

    /**
     * Create a new client handle connected to the same player core as ctx. This
     * context has its own event queue, its own mpv_request_event() state, its own
     * mpv_request_log_messages() state, its own set of observed properties, and
     * its own state for asynchronous operations. Otherwise, everything is shared.
     *
     * This handle should be destroyed with mpv_destroy() if no longer
     * needed. The core will live as long as there is at least 1 handle referencing
     * it. Any handle can make the core quit, which will result in every handle
     * receiving MPV_EVENT_SHUTDOWN.
     *
     * This function can not be called before the main handle was initialized with
     * mpv_initialize(). The new handle is always initialized, unless ctx=NULL was
     * passed.
     *
     * @param ctx Used to get the reference to the mpv core; handle-specific
     *            settings and parameters are not used.
     *            If NULL, this function behaves like mpv_create() (ignores name).
     * @param name The client name. This will be returned by mpv_client_name(). If
     *             the name is already in use, or contains non-alphanumeric
     *             characters (other than '_'), the name is modified to fit.
     *             If NULL, an arbitrary name is automatically chosen.
     * @return a new handle, or NULL on error
     */
    create_client :: proc(ctx: ^Handle, name: cstring) -> ^Handle ---;

    /**
     * This is the same as mpv_create_client(), but the created mpv_handle is
     * treated as a weak reference. If all mpv_handles referencing a core are
     * weak references, the core is automatically destroyed. (This still goes
     * through normal uninit of course. Effectively, if the last non-weak mpv_handle
     * is destroyed, then the weak mpv_handles receive MPV_EVENT_SHUTDOWN and are
     * asked to terminate as well.)
     *
     * Note if you want to use this like refcounting: you have to be aware that
     * mpv_terminate_destroy() _and_ mpv_destroy() for the last non-weak
     * mpv_handle will block until all weak mpv_handles are destroyed.
     */
    create_weak_client :: proc(ctx: ^Handle, name: cstring) -> ^Handle --- ;

    /**
     * Load a config file. This loads and parses the file, and sets every entry in
     * the config file's default section as if mpv_set_option_string() is called.
     *
     * The filename should be an absolute path. If it isn't, the actual path used
     * is unspecified. (Note: an absolute path starts with '/' on UNIX.) If the
     * file wasn't found, MPV_ERROR_INVALID_PARAMETER is returned.
     *
     * If a fatal error happens when parsing a config file, MPV_ERROR_OPTION_ERROR
     * is returned. Errors when setting options as well as other types or errors
     * are ignored (even if options do not exist). You can still try to capture
     * the resulting error messages with mpv_request_log_messages(). Note that it's
     * possible that some options were successfully set even if any of these errors
     * happen.
     *
     * @param filename absolute path to the config file on the local filesystem
     * @return error code
     */
    load_config_file :: proc(ctx: ^Handle, filename: cstring) -> i32 ---;

    when #defined(MPV_ENABLE_DEPRECATED) {

    /**
     * This does nothing since mpv 0.23.0 (API version 1.24). Below is the
     * description of the old behavior.
     *
     * Stop the playback thread. This means the core will stop doing anything, and
     * only run and answer to client API requests. This is sometimes useful; for
     * example, no new frame will be queued to the video output, so doing requests
     * which have to wait on the video output can run instantly.
     *
     * Suspension is reentrant and recursive for convenience. Any thread can call
     * the suspend function multiple times, and the playback thread will remain
     * suspended until the last thread resumes it. Note that during suspension, all
     * clients still have concurrent access to the core, which is serialized through
     * a single mutex.
     *
     * Call mpv_resume() to resume the playback thread. You must call mpv_resume()
     * for each mpv_suspend() call. Calling mpv_resume() more often than
     * mpv_suspend() is not allowed.
     *
     * Calling this on an uninitialized player (see mpv_create()) will deadlock.
     *
     * @deprecated This function, as well as mpv_resume(), are deprecated, and
     *             will stop doing anything soon. Their semantics were never
     *             well-defined, and their usefulness is extremely limited. The
     *             calls will remain stubs in order to keep ABI compatibility.
     */
    suspend :: proc(ctx: ^Handle) ---;

    /**
     * See mpv_suspend().
     */
    resume :: proc(ctx: ^Handle) ---;

    }

    /**
     * Return the internal time in microseconds. This has an arbitrary start offset,
     * but will never wrap or go backwards.
     *
     * Note that this is always the real time, and doesn't necessarily have to do
     * with playback time. For example, playback could go faster or slower due to
     * playback speed, or due to playback being paused. Use the "time-pos" property
     * instead to get the playback status.
     *
     * Unlike other libmpv APIs, this can be called at absolutely any time (even
     * within wakeup callbacks), as long as the context is valid.
     *
     * Safe to be called from mpv render API threads.
     */
    get_time_us :: proc(ctx: ^Handle) -> i64 ---;
}

/**
 * Data format for options and properties. The API functions to get/set
 * properties and options support multiple formats, and this enum describes
 * them.
 */
Format :: enum u32 {
    /**
     * Invalid. Sometimes used for empty values.
     */
    None             = 0,
    /**
     * The basic type is char*. It returns the raw property string, like
     * using ${=property} in input.conf (see input.rst).
     *
     * NULL isn't an allowed value.
     *
     * Warning: although the encoding is usually UTF-8, this is not always the
     *          case. File tags often store strings in some legacy codepage,
     *          and even filenames don't necessarily have to be in UTF-8 (at
     *          least on Linux). If you pass the strings to code that requires
     *          valid UTF-8, you have to sanitize it in some way.
     *          On Windows, filenames are always UTF-8, and libmpv converts
     *          between UTF-8 and UTF-16 when using win32 API functions. See
     *          the "Encoding of filenames" section for details.
     *
     * Example for reading:
     *
     *     char *result = NULL;
     *     if (mpv_get_property(ctx, "property", MPV_FORMAT_STRING, &result) < 0)
     *         goto error;
     *     printf("%s\n", result);
     *     mpv_free(result);
     *
     * Or just use mpv_get_property_string().
     *
     * Example for writing:
     *
     *     char *value = "the new value";
     *     // yep, you pass the address to the variable
     *     // (needed for symmetry with other types and mpv_get_property)
     *     mpv_set_property(ctx, "property", MPV_FORMAT_STRING, &value);
     *
     * Or just use mpv_set_property_string().
     *
     */
    String           = 1,
    /**
     * The basic type is char*. It returns the OSD property string, like
     * using ${property} in input.conf (see input.rst). In many cases, this
     * is the same as the raw string, but in other cases it's formatted for
     * display on OSD. It's intended to be human readable. Do not attempt to
     * parse these strings.
     *
     * Only valid when doing read access. The rest works like MPV_FORMAT_STRING.
     */
    OSD_String       = 2,
    /**
     * The basic type is int. The only allowed values are 0 ("no")
     * and 1 ("yes").
     *
     * Example for reading:
     *
     *     int result;
     *     if (mpv_get_property(ctx, "property", MPV_FORMAT_FLAG, &result) < 0)
     *         goto error;
     *     printf("%s\n", result ? "true" : "false");
     *
     * Example for writing:
     *
     *     int flag = 1;
     *     mpv_set_property(ctx, "property", MPV_FORMAT_FLAG, &flag);
     */
    Flag             = 3,
    /**
     * The basic type is int64_t.
     */
    Int64            = 4,
    /**
     * The basic type is double.
     */
    Double           = 5,
    /**
     * The type is mpv_node.
     *
     * For reading, you usually would pass a pointer to a stack-allocated
     * mpv_node value to mpv, and when you're done you call
     * mpv_free_node_contents(&node).
     * You're expected not to write to the data - if you have to, copy it
     * first (which you have to do manually).
     *
     * For writing, you construct your own mpv_node, and pass a pointer to the
     * API. The API will never write to your data (and copy it if needed), so
     * you're free to use any form of allocation or memory management you like.
     *
     * Warning: when reading, always check the mpv_node.format member. For
     *          example, properties might change their type in future versions
     *          of mpv, or sometimes even during runtime.
     *
     * Example for reading:
     *
     *     mpv_node result;
     *     if (mpv_get_property(ctx, "property", MPV_FORMAT_NODE, &result) < 0)
     *         goto error;
     *     printf("format=%d\n", (int)result.format);
     *     mpv_free_node_contents(&result).
     *
     * Example for writing:
     *
     *     mpv_node value;
     *     value.format = MPV_FORMAT_STRING;
     *     value.u.string = "hello";
     *     mpv_set_property(ctx, "property", MPV_FORMAT_NODE, &value);
     */
    Node             = 6,
    /**
     * Used with mpv_node only. Can usually not be used directly.
     */
    Node_Array       = 7,
    /**
     * See MPV_FORMAT_NODE_ARRAY.
     */
    Node_Map         = 8,
    /**
     * A raw, untyped byte array. Only used only with mpv_node, and only in
     * some very special situations. (Currently, only for the screenshot-raw
     * command.)
     */
    Byte_Array       = 9
}

/**
 * Generic data storage.
 *
 * If mpv writes this struct (e.g. via mpv_get_property()), you must not change
 * the data. In some cases (mpv_get_property()), you have to free it with
 * mpv_free_node_contents(). If you fill this struct yourself, you're also
 * responsible for freeing it, and you must not call mpv_free_node_contents().
 */
Node :: struct {
    u: struct #raw_union {
        string_: cstring,   /** valid if format==MPV_FORMAT_STRING */
        flag: i32,          /** valid if format==MPV_FORMAT_FLAG   */
        int64: i64,         /** valid if format==MPV_FORMAT_INT64  */
        double: f64,        /** valid if format==MPV_FORMAT_DOUBLE */
        /**
         * valid if format==MPV_FORMAT_NODE_ARRAY
         *    or if format==MPV_FORMAT_NODE_MAP
         */
        list: ^Node_List,
        /**
         * valid if format==MPV_FORMAT_BYTE_ARRAY
         */
        ba: ^Byte_Array,
    },
    /**
     * Type of the data stored in this struct. This value rules what members in
     * the given union can be accessed. The following formats are currently
     * defined to be allowed in mpv_node:
     *
     *  MPV_FORMAT_STRING       (u.string)
     *  MPV_FORMAT_FLAG         (u.flag)
     *  MPV_FORMAT_INT64        (u.int64)
     *  MPV_FORMAT_DOUBLE       (u.double_)
     *  MPV_FORMAT_NODE_ARRAY   (u.list)
     *  MPV_FORMAT_NODE_MAP     (u.list)
     *  MPV_FORMAT_BYTE_ARRAY   (u.ba)
     *  MPV_FORMAT_NONE         (no member)
     *
     * If you encounter a value you don't know, you must not make any
     * assumptions about the contents of union u.
     */
    format: Format,
}

/**
 * (see mpv_node)
 */
Node_List :: struct {
    /**
     * Number of entries. Negative values are not allowed.
     */
    num: i32, /**
     * MPV_FORMAT_NODE_ARRAY:
     *  values[N] refers to value of the Nth item
     *
     * MPV_FORMAT_NODE_MAP:
     *  values[N] refers to value of the Nth key/value pair
     *
     * If num > 0, values[0] to values[num-1] (inclusive) are valid.
     * Otherwise, this can be NULL.
     */
    values: ^Node,
    /**
     * MPV_FORMAT_NODE_ARRAY:
     *  unused (typically NULL), access is not allowed
     *
     * MPV_FORMAT_NODE_MAP:
     *  keys[N] refers to key of the Nth key/value pair. If num > 0, keys[0] to
     *  keys[num-1] (inclusive) are valid. Otherwise, this can be NULL.
     *  The keys are in random order. The only guarantee is that keys[N] belongs
     *  to the value values[N]. NULL keys are not allowed.
     */
    keys: ^cstring,
}

/**
 * (see mpv_node)
 */
Byte_Array :: struct {
    /**
     * Pointer to the data. In what format the data is stored is up to whatever
     * uses MPV_FORMAT_BYTE_ARRAY.
     */
    data: rawptr,
    /**
     * Size of the data pointed to by ptr.
     */
    size: u64,
}

@(default_calling_convention="c", link_prefix="mpv_")
foreign mpv_lib {
    /**
     * Frees any data referenced by the node. It doesn't free the node itself.
     * Call this only if the mpv client API set the node. If you constructed the
     * node yourself (manually), you have to free it yourself.
     *
     * If node->format is MPV_FORMAT_NONE, this call does nothing. Likewise, if
     * the client API sets a node with this format, this function doesn't need to
     * be called. (This is just a clarification that there's no danger of anything
     * strange happening in these cases.)
     */
    free_node_contents :: proc(node: ^Node) ---;

    /**
     * Set an option. Note that you can't normally set options during runtime. It
     * works in uninitialized state (see mpv_create()), and in some cases in at
     * runtime.
     *
     * Using a format other than MPV_FORMAT_NODE is equivalent to constructing a
     * mpv_node with the given format and data, and passing the mpv_node to this
     * function.
     *
     * Note: this is semi-deprecated. For most purposes, this is not needed anymore.
     *       Starting with mpv version 0.21.0 (version 1.23) most options can be set
     *       with mpv_set_property() (and related functions), and even before
     *       mpv_initialize(). In some obscure corner cases, using this function
     *       to set options might still be required (see below, and also section
     *       "Inconsistencies between options and properties" on the manpage). Once
     *       these are resolved, the option setting functions might be fully
     *       deprecated.
     *
     *       The following options still need to be set either _before_
     *       mpv_initialize() with mpv_set_property() (or related functions), or
     *       with mpv_set_option() (or related functions) at any time:
     *              - options shadowed by deprecated properties:
     *                - demuxer (property deprecated in 0.21.0)
     *                - idle (property deprecated in 0.21.0)
     *                - fps (property deprecated in 0.21.0)
     *                - cache (property deprecated in 0.21.0)
     *                - length (property deprecated in 0.10.0)
     *                - audio-samplerate (property deprecated in 0.10.0)
     *                - audio-channels (property deprecated in 0.10.0)
     *                - audio-format (property deprecated in 0.10.0)
     *              - deprecated options shadowed by properties:
     *                - chapter (option deprecated in 0.21.0)
     *                - playlist-pos (option deprecated in 0.21.0)
     *       The deprecated properties were removed in mpv 0.23.0.
     *
     * @param name Option name. This is the same as on the mpv command line, but
     *             without the leading "--".
     * @param format see enum mpv_format.
     * @param[in] data Option value (according to the format).
     * @return error code
     */
    set_option :: proc(ctx: ^Handle, name: cstring, format: Format, data: rawptr) -> i32 ---;

    /**
     * Convenience function to set an option to a string value. This is like
     * calling mpv_set_option() with MPV_FORMAT_STRING.
     *
     * @return error code
     */
    set_option_string :: proc(ctx: ^Handle, name: cstring, data: cstring) -> i32 ---;

    /**
     * Send a command to the player. Commands are the same as those used in
     * input.conf, except that this function takes parameters in a pre-split
     * form.
     *
     * The commands and their parameters are documented in input.rst.
     *
     * Does not use OSD and string expansion by default (unlike mpv_command_string()
     * and input.conf).
     *
     * @param[in] args NULL-terminated list of strings. Usually, the first item
     *                 is the command, and the following items are arguments.
     * @return error code
     */
    command :: proc(ctx: ^Handle, args: ^cstring) -> i32 ---;

    /**
     * Same as mpv_command(), but allows passing structured data in any format.
     * In particular, calling mpv_command() is exactly like calling
     * mpv_command_node() with the format set to MPV_FORMAT_NODE_ARRAY, and
     * every arg passed in order as MPV_FORMAT_STRING.
     *
     * Does not use OSD and string expansion by default.
     *
     * The args argument can have one of the following formats:
     *
     * MPV_FORMAT_NODE_ARRAY:
     *      Positional arguments. Each entry is an argument using an arbitrary
     *      format (the format must be compatible to the used command). Usually,
     *      the first item is the command name (as MPV_FORMAT_STRING). The order
     *      of arguments is as documented in each command description.
     *
     * MPV_FORMAT_NODE_MAP:
     *      Named arguments. This requires at least an entry with the key "name"
     *      to be present, which must be a string, and contains the command name.
     *      The special entry "_flags" is optional, and if present, must be an
     *      array of strings, each being a command prefix to apply. All other
     *      entries are interpreted as arguments. They must use the argument names
     *      as documented in each command description. Some commands do not
     *      support named arguments at all, and must use MPV_FORMAT_NODE_ARRAY.
     *
     * @param[in] args mpv_node with format set to one of the values documented
     *                 above (see there for details)
     * @param[out] result Optional, pass NULL if unused. If not NULL, and if the
     *                    function succeeds, this is set to command-specific return
     *                    data. You must call mpv_free_node_contents() to free it
     *                    (again, only if the command actually succeeds).
     *                    Not many commands actually use this at all.
     * @return error code (the result parameter is not set on error)
     */
    command_node :: proc(ctx: ^Handle, args: ^Node, result: ^Node) -> i32 ---;

    /**
     * Same as mpv_command, but use input.conf parsing for splitting arguments.
     * This is slightly simpler, but also more error prone, since arguments may
     * need quoting/escaping.
     *
     * This also has OSD and string expansion enabled by default.
     */
    command_string :: proc(ctx: ^Handle, args: cstring) -> i32 ---;

    /**
     * Same as mpv_command, but run the command asynchronously.
     *
     * Commands are executed asynchronously. You will receive a
     * MPV_EVENT_COMMAND_REPLY event. This event will also have an
     * error code set if running the command failed. For commands that
     * return data, the data is put into mpv_event_command.result.
     *
     * Safe to be called from mpv render API threads.
     *
     * @param reply_userdata the value mpv_event.reply_userdata of the reply will
     *                       be set to (see section about asynchronous calls)
     * @param args NULL-terminated list of strings (see mpv_command())
     * @return error code (if parsing or queuing the command fails)
     */
    command_async :: proc(ctx: ^Handle, reply_userdata: u64, args: ^cstring) -> i32 ---;

    /**
     * Same as mpv_command_node(), but run it asynchronously. Basically, this
     * function is to mpv_command_node() what mpv_command_async() is to
     * mpv_command().
     *
     * See mpv_command_async() for details.
     *
     * Safe to be called from mpv render API threads.
     *
     * @param reply_userdata the value mpv_event.reply_userdata of the reply will
     *                       be set to (see section about asynchronous calls)
     * @param args as in mpv_command_node()
     * @return error code (if parsing or queuing the command fails)
     */
    command_node_async :: proc(ctx: ^Handle, reply_userdata: u64, args: ^Node) -> i32 ---;

    /**
     * Signal to all async requests with the matching ID to abort. This affects
     * the following API calls:
     *
     *      mpv_command_async
     *      mpv_command_node_async
     *
     * All of these functions take a reply_userdata parameter. This API function
     * tells all requests with the matching reply_userdata value to try to return
     * as soon as possible. If there are multiple requests with matching ID, it
     * aborts all of them.
     *
     * This API function is mostly asynchronous itself. It will not wait until the
     * command is aborted. Instead, the command will terminate as usual, but with
     * some work not done. How this is signaled depends on the specific command (for
     * example, the "subprocess" command will indicate it by "killed_by_us" set to
     * true in the result). How long it takes also depends on the situation. The
     * aborting process is completely asynchronous.
     *
     * Not all commands may support this functionality. In this case, this function
     * will have no effect. The same is true if the request using the passed
     * reply_userdata has already terminated, has not been started yet, or was
     * never in use at all.
     *
     * You have to be careful of race conditions: the time during which the abort
     * request will be effective is _after_ e.g. mpv_command_async() has returned,
     * and before the command has signaled completion with MPV_EVENT_COMMAND_REPLY.
     *
     * @param reply_userdata ID of the request to be aborted (see above)
     */
    abort_async_command :: proc(ctx: ^Handle, reply_userdata: u64) ---;

    /**
     * Set a property to a given value. Properties are essentially variables which
     * can be queried or set at runtime. For example, writing to the pause property
     * will actually pause or unpause playback.
     *
     * If the format doesn't match with the internal format of the property, access
     * usually will fail with MPV_ERROR_PROPERTY_FORMAT. In some cases, the data
     * is automatically converted and access succeeds. For example, MPV_FORMAT_INT64
     * is always converted to MPV_FORMAT_DOUBLE, and access using MPV_FORMAT_STRING
     * usually invokes a string parser. The same happens when calling this function
     * with MPV_FORMAT_NODE: the underlying format may be converted to another
     * type if possible.
     *
     * Using a format other than MPV_FORMAT_NODE is equivalent to constructing a
     * mpv_node with the given format and data, and passing the mpv_node to this
     * function. (Before API version 1.21, this was different.)
     *
     * Note: starting with mpv 0.21.0 (client API version 1.23), this can be used to
     *       set options in general. It even can be used before mpv_initialize()
     *       has been called. If called before mpv_initialize(), setting properties
     *       not backed by options will result in MPV_ERROR_PROPERTY_UNAVAILABLE.
     *       In some cases, properties and options still conflict. In these cases,
     *       mpv_set_property() accesses the options before mpv_initialize(), and
     *       the properties after mpv_initialize(). These conflicts will be removed
     *       in mpv 0.23.0. See mpv_set_option() for further remarks.
     *
     * @param name The property name. See input.rst for a list of properties.
     * @param format see enum mpv_format.
     * @param[in] data Option value.
     * @return error code
     */
    set_property :: proc(ctx: ^Handle, name: cstring, format: Format, data: rawptr) -> i32 ---;

    /**
     * Convenience function to set a property to a string value.
     *
     * This is like calling mpv_set_property() with MPV_FORMAT_STRING.
     */
    set_property_string :: proc(ctx: ^Handle, name: cstring, data: cstring) -> i32 ---;

    /**
     * Set a property asynchronously. You will receive the result of the operation
     * as MPV_EVENT_SET_PROPERTY_REPLY event. The mpv_event.error field will contain
     * the result status of the operation. Otherwise, this function is similar to
     * mpv_set_property().
     *
     * Safe to be called from mpv render API threads.
     *
     * @param reply_userdata see section about asynchronous calls
     * @param name The property name.
     * @param format see enum mpv_format.
     * @param[in] data Option value. The value will be copied by the function. It
     *                 will never be modified by the client API.
     * @return error code if sending the request failed
     */
    set_property_async :: proc(ctx: ^Handle, reply_userdata: u64, name: cstring, format: Format, data: rawptr) -> i32 ---;

    /**
     * Read the value of the given property.
     *
     * If the format doesn't match with the internal format of the property, access
     * usually will fail with MPV_ERROR_PROPERTY_FORMAT. In some cases, the data
     * is automatically converted and access succeeds. For example, MPV_FORMAT_INT64
     * is always converted to MPV_FORMAT_DOUBLE, and access using MPV_FORMAT_STRING
     * usually invokes a string formatter.
     *
     * @param name The property name.
     * @param format see enum mpv_format.
     * @param[out] data Pointer to the variable holding the option value. On
     *                  success, the variable will be set to a copy of the option
     *                  value. For formats that require dynamic memory allocation,
     *                  you can free the value with mpv_free() (strings) or
     *                  mpv_free_node_contents() (MPV_FORMAT_NODE).
     * @return error code
     */
    get_property :: proc(ctx: ^Handle, name: cstring, format: Format, data: rawptr) -> i32 ---;

    /**
     * Return the value of the property with the given name as string. This is
     * equivalent to mpv_get_property() with MPV_FORMAT_STRING.
     *
     * See MPV_FORMAT_STRING for character encoding issues.
     *
     * On error, NULL is returned. Use mpv_get_property() if you want fine-grained
     * error reporting.
     *
     * @param name The property name.
     * @return Property value, or NULL if the property can't be retrieved. Free
     *         the string with mpv_free().
     */
    get_property_string :: proc(ctx: ^Handle, name: cstring) -> cstring ---;

    /**
     * Return the property as "OSD" formatted string. This is the same as
     * mpv_get_property_string, but using MPV_FORMAT_OSD_STRING.
     *
     * @return Property value, or NULL if the property can't be retrieved. Free
     *         the string with mpv_free().
     */
    get_property_osd_string :: proc(ctx: ^Handle, name: cstring) -> cstring ---;

    /**
     * Get a property asynchronously. You will receive the result of the operation
     * as well as the property data with the MPV_EVENT_GET_PROPERTY_REPLY event.
     * You should check the mpv_event.error field on the reply event.
     *
     * Safe to be called from mpv render API threads.
     *
     * @param reply_userdata see section about asynchronous calls
     * @param name The property name.
     * @param format see enum mpv_format.
     * @return error code if sending the request failed
     */
    get_property_async :: proc(ctx: ^Handle, reply_userdata: u64, name: cstring, format: Format) -> i32 ---;

    /**
     * Get a notification whenever the given property changes. You will receive
     * updates as MPV_EVENT_PROPERTY_CHANGE. Note that this is not very precise:
     * for some properties, it may not send updates even if the property changed.
     * This depends on the property, and it's a valid feature request to ask for
     * better update handling of a specific property. (For some properties, like
     * ``clock``, which shows the wall clock, this mechanism doesn't make too
     * much sense anyway.)
     *
     * Property changes are coalesced: the change events are returned only once the
     * event queue becomes empty (e.g. mpv_wait_event() would block or return
     * MPV_EVENT_NONE), and then only one event per changed property is returned.
     *
     * Normally, change events are sent only if the property value changes according
     * to the requested format. mpv_event_property will contain the property value
     * as data member.
     *
     * Warning: if a property is unavailable or retrieving it caused an error,
     *          MPV_FORMAT_NONE will be set in mpv_event_property, even if the
     *          format parameter was set to a different value. In this case, the
     *          mpv_event_property.data field is invalid.
     *
     * If the property is observed with the format parameter set to MPV_FORMAT_NONE,
     * you get low-level notifications whether the property _may_ have changed, and
     * the data member in mpv_event_property will be unset. With this mode, you
     * will have to determine yourself whether the property really changd. On the
     * other hand, this mechanism can be faster and uses less resources.
     *
     * Observing a property that doesn't exist is allowed. (Although it may still
     * cause some sporadic change events.)
     *
     * Keep in mind that you will get change notifications even if you change a
     * property yourself. Try to avoid endless feedback loops, which could happen
     * if you react to the change notifications triggered by your own change.
     *
     * Only the mpv_handle on which this was called will receive the property
     * change events, or can unobserve them.
     *
     * Safe to be called from mpv render API threads.
     *
     * @param reply_userdata This will be used for the mpv_event.reply_userdata
     *                       field for the received MPV_EVENT_PROPERTY_CHANGE
     *                       events. (Also see section about asynchronous calls,
     *                       although this function is somewhat different from
     *                       actual asynchronous calls.)
     *                       If you have no use for this, pass 0.
     *                       Also see mpv_unobserve_property().
     * @param name The property name.
     * @param format see enum mpv_format. Can be MPV_FORMAT_NONE to omit values
     *               from the change events.
     * @return error code (usually fails only on OOM or unsupported format)
     */
    observe_property :: proc(mpv: ^Handle, reply_userdata: u64, name: cstring, format: Format) -> i32 ---;

    /**
     * Undo mpv_observe_property(). This will remove all observed properties for
     * which the given number was passed as reply_userdata to mpv_observe_property.
     *
     * Safe to be called from mpv render API threads.
     *
     * @param registered_reply_userdata ID that was passed to mpv_observe_property
     * @return negative value is an error code, >=0 is number of removed properties
     *         on success (includes the case when 0 were removed)
     */
    unobserve_property :: proc(mpv: ^Handle, registered_reply_userdata: u64) -> i32 ---;
}

Event_ID :: enum u32 {
    /**
     * Nothing happened. Happens on timeouts or sporadic wakeups.
     */
    None              = 0,
    /**
     * Happens when the player quits. The player enters a state where it tries
     * to disconnect all clients. Most requests to the player will fail, and
     * the client should react to this and quit with mpv_destroy() as soon as
     * possible.
     */
    Shutdown          = 1,
    /**
     * See mpv_request_log_messages().
     */
    Log_Message       = 2,
    /**
     * Reply to a mpv_get_property_async() request.
     * See also mpv_event and mpv_event_property.
     */
    Get_Property_Reply = 3,
    /**
     * Reply to a mpv_set_property_async() request.
     * (Unlike MPV_EVENT_GET_PROPERTY, mpv_event_property is not used.)
     */
    Set_Property_Reply = 4,
    /**
     * Reply to a mpv_command_async() or mpv_command_node_async() request.
     * See also mpv_event and mpv_event_command.
     */
    Command_Reply     = 5,
    /**
     * Notification before playback start of a file (before the file is loaded).
     */
    Start_File        = 6,
    /**
     * Notification after playback end (after the file was unloaded).
     * See also mpv_event and mpv_event_end_file.
     */
    End_File          = 7,
    /**
     * Notification when the file has been loaded (headers were read etc.), and
     * decoding starts.
     */
    File_Loaded       = 8,
    /**
     * The list of video/audio/subtitle tracks was changed. (E.g. a new track
     * was found. This doesn't necessarily indicate a track switch; for this,
     * MPV_EVENT_TRACK_SWITCHED is used.)
     *
     * @deprecated This is equivalent to using mpv_observe_property() on the
     *             "track-list" property. The event is redundant, and might
     *             be removed in the far future.
     */
    Tracks_Changed    = 9,
    /**
     * A video/audio/subtitle track was switched on or off.
     *
     * @deprecated This is equivalent to using mpv_observe_property() on the
     *             "vid", "aid", and "sid" properties. The event is redundant,
     *             and might be removed in the far future.
     */
    Track_Switched    = 10,
    /**
     * Idle mode was entered. In this mode, no file is played, and the playback
     * core waits for new commands. (The command line player normally quits
     * instead of entering idle mode, unless --idle was specified. If mpv
     * was started with mpv_create(), idle mode is enabled by default.)
     */
    Idle              = 11,
    /**
     * Playback was paused. This indicates the user pause state.
     *
     * The user pause state is the state the user requested (changed with the
     * "pause" property). There is an internal pause state too, which is entered
     * if e.g. the network is too slow (the "core-idle" property generally
     * indicates whether the core is playing or waiting).
     *
     * This event is sent whenever any pause states change, not only the user
     * state. You might get multiple events in a row while these states change
     * independently. But the event ID sent always indicates the user pause
     * state.
     *
     * If you don't want to deal with this, use mpv_observe_property() on the
     * "pause" property and ignore MPV_EVENT_PAUSE/UNPAUSE. Likewise, the
     * "core-idle" property tells you whether video is actually playing or not.
     *
     * @deprecated The event is redundant with mpv_observe_property() as
     *             mentioned above, and might be removed in the far future.
     */
    Pause             = 12,
    /**
     * Playback was unpaused. See MPV_EVENT_PAUSE for not so obvious details.
     *
     * @deprecated The event is redundant with mpv_observe_property() as
     *             explained in the MPV_EVENT_PAUSE comments, and might be
     *             removed in the far future.
     */
    Unpause           = 13,
    /**
     * Sent every time after a video frame is displayed. Note that currently,
     * this will be sent in lower frequency if there is no video, or playback
     * is paused - but that will be removed in the future, and it will be
     * restricted to video frames only.
     */
    Tick              = 14,
    /**
     * @deprecated This was used internally with the internal "script_dispatch"
     *             command to dispatch keyboard and mouse input for the OSC.
     *             It was never useful in general and has been completely
     *             replaced with "script-binding".
     *             This event never happens anymore, and is included in this
     *             header only for compatibility.
     */
    Script_Input_Dispatch = 15,
    /**
     * Triggered by the script-message input command. The command uses the
     * first argument of the command as client name (see mpv_client_name()) to
     * dispatch the message, and passes along all arguments starting from the
     * second argument as strings.
     * See also mpv_event and mpv_event_client_message.
     */
    Client_Message    = 16,
    /**
     * Happens after video changed in some way. This can happen on resolution
     * changes, pixel format changes, or video filter changes. The event is
     * sent after the video filters and the VO are reconfigured. Applications
     * embedding a mpv window should listen to this event in order to resize
     * the window if needed.
     * Note that this event can happen sporadically, and you should check
     * yourself whether the video parameters really changed before doing
     * something expensive.
     */
    Video_Reconfig    = 17,
    /**
     * Similar to MPV_EVENT_VIDEO_RECONFIG. This is relatively uninteresting,
     * because there is no such thing as audio output embedding.
     */
    Audio_Reconfig    = 18,
    /**
     * Happens when metadata (like file tags) is possibly updated. (It's left
     * unspecified whether this happens on file start or only when it changes
     * within a file.)
     *
     * @deprecated This is equivalent to using mpv_observe_property() on the
     *             "metadata" property. The event is redundant, and might
     *             be removed in the far future.
     */
    Metadata_Update   = 19,
    /**
     * Happens when a seek was initiated. Playback stops. Usually it will
     * resume with MPV_EVENT_PLAYBACK_RESTART as soon as the seek is finished.
     */
    Seek              = 20,
    /**
     * There was a discontinuity of some sort (like a seek), and playback
     * was reinitialized. Usually happens after seeking, or ordered chapter
     * segment switches. The main purpose is allowing the client to detect
     * when a seek request is finished.
     */
    Playback_Restart  = 21,
    /**
     * Event sent due to mpv_observe_property().
     * See also mpv_event and mpv_event_property.
     */
    Property_Change   = 22,
    /**
     * Happens when the current chapter changes.
     *
     * @deprecated This is equivalent to using mpv_observe_property() on the
     *             "chapter" property. The event is redundant, and might
     *             be removed in the far future.
     */
    Chapter_Change    = 23,
    /**
     * Happens if the internal per-mpv_handle ringbuffer overflows, and at
     * least 1 event had to be dropped. This can happen if the client doesn't
     * read the event queue quickly enough with mpv_wait_event(), or if the
     * client makes a very large number of asynchronous calls at once.
     *
     * Event delivery will continue normally once this event was returned
     * (this forces the client to empty the queue completely).
     */
    Queue_Overflow    = 24,
    /**
     * Triggered if a hook handler was registered with mpv_hook_add(), and the
     * hook is invoked. If you receive this, you must handle it, and continue
     * the hook with mpv_hook_continue().
     * See also mpv_event and mpv_event_hook.
     */
    Hook              = 25,
    // Internal note: adjust INTERNAL_EVENT_BASE when adding new events.
}

@(default_calling_convention="c", link_prefix="mpv_")
foreign mpv_lib {
    /**
     * Return a string describing the event. For unknown events, NULL is returned.
     *
     * Note that all events actually returned by the API will also yield a non-NULL
     * string with this function.
     *
     * @param event event ID, see see enum mpv_event_id
     * @return A static string giving a short symbolic name of the event. It
     *         consists of lower-case alphanumeric characters and can include "-"
     *         characters. This string is suitable for use in e.g. scripting
     *         interfaces.
     *         The string is completely static, i.e. doesn't need to be deallocated,
     *         and is valid forever.
     */
    event_name :: proc(event: Event_ID) -> cstring ---;
}

Event_Property :: struct {
    /**
     * Name of the property.
     */
    name: cstring,
    /**
     * Format of the data field in the same struct. See enum mpv_format.
     * This is always the same format as the requested format, except when
     * the property could not be retrieved (unavailable, or an error happened),
     * in which case the format is MPV_FORMAT_NONE.
     */
    format: Format,
    /**
     * Received property value. Depends on the format. This is like the
     * pointer argument passed to mpv_get_property().
     *
     * For example, for MPV_FORMAT_STRING you get the string with:
     *
     *    char *value = *(char **)(event_property->data);
     *
     * Note that this is set to NULL if retrieving the property failed (the
     * format will be MPV_FORMAT_NONE).
     * See mpv_event.error for the status.
     */
    data: rawptr,
}

/**
 * Numeric log levels. The lower the number, the more important the message is.
 * MPV_LOG_LEVEL_NONE is never used when receiving messages. The string in
 * the comment after the value is the name of the log level as used for the
 * mpv_request_log_messages() function.
 * Unused numeric values are unused, but reserved for future use.
 */
Log_Level :: enum u32 {
    None  = 0,    /// "no"    - disable absolutely all messages
    Fatal = 10,   /// "fatal" - critical/aborting errors
    Error = 20,   /// "error" - simple errors
    Warn  = 30,   /// "warn"  - possible problems
    Info  = 40,   /// "info"  - informational message
    V     = 50,   /// "v"     - noisy informational message
    Debug = 60,   /// "debug" - very noisy technical information
    Trace = 70,   /// "trace" - extremely noisy
}

Event_Log_Message :: struct {
    /**
     * The module prefix, identifies the sender of the message. As a special
     * case, if the message buffer overflows, this will be set to the string
     * "overflow" (which doesn't appear as prefix otherwise), and the text
     * field will contain an informative message.
     */
    prefix: cstring,
    /**
     * The log level as string. See mpv_request_log_messages() for possible
     * values. The level "no" is never used here.
     */
    level: cstring,
    /**
     * The log message. It consists of 1 line of text, and is terminated with
     * a newline character. (Before API version 1.6, it could contain multiple
     * or partial lines.)
     */
    text: cstring,
    /**
     * The same contents as the level field, but as a numeric ID.
     * Since API version 1.6.
     */
    log_level: Log_Level,
}

/// Since API version 1.9.
End_File_Reason :: enum u32 {
    /**
     * The end of file was reached. Sometimes this may also happen on
     * incomplete or corrupted files, or if the network connection was
     * interrupted when playing a remote file. It also happens if the
     * playback range was restricted with --end or --frames or similar.
     */
    EOF = 0,
    /**
     * Playback was stopped by an external action (e.g. playlist controls).
     */
    Stop = 2,
    /**
     * Playback was stopped by the quit command or player shutdown.
     */
    Quit = 3,
    /**
     * Some kind of error happened that lead to playback abort. Does not
     * necessarily happen on incomplete or broken files (in these cases, both
     * MPV_END_FILE_REASON_ERROR or MPV_END_FILE_REASON_EOF are possible).
     *
     * mpv_event_end_file.error will be set.
     */
    Error = 4,
    /**
     * The file was a playlist or similar. When the playlist is read, its
     * entries will be appended to the playlist after the entry of the current
     * file, the entry of the current file is removed, and a MPV_EVENT_END_FILE
     * event is sent with reason set to MPV_END_FILE_REASON_REDIRECT. Then
     * playback continues with the playlist contents.
     * Since API version 1.18.
     */
    Redirect = 5,
}

Event_End_File :: struct {
    /**
     * Corresponds to the values in enum mpv_end_file_reason (the "int" type
     * will be replaced with mpv_end_file_reason on the next ABI bump).
     *
     * Unknown values should be treated as unknown.
     */
    reason: i32,
    /**
     * If reason==MPV_END_FILE_REASON_ERROR, this contains a mpv error code
     * (one of MPV_ERROR_...) giving an approximate reason why playback
     * failed. In other cases, this field is 0 (no error).
     * Since API version 1.9.
     */
    error: i32,
}

when #defined(MPV_ENABLE_DEPRECATED) {
    /** @deprecated see MPV_EVENT_SCRIPT_INPUT_DISPATCH for remarks
     */
    Event_Script_Input_Dispatch :: struct {
        arg0: i32,
        type: cstring,
    }
}

Event_Client_Message :: struct {
    /**
     * Arbitrary arguments chosen by the sender of the message. If num_args > 0,
     * you can access args[0] through args[num_args - 1] (inclusive). What
     * these arguments mean is up to the sender and receiver.
     * None of the valid items are NULL.
     */
    num_args: i32,
    args: ^cstring,
}

Event_Hook :: struct {
    /**
     * The hook name as passed to mpv_hook_add().
     */
    name: cstring,
    /**
     * Internal ID that must be passed to mpv_hook_continue().
     */
    id: u64,
}

// Since API version 1.102.
Event_Command :: struct {
    /**
     * Result data of the command. Note that success/failure is signaled
     * separately via mpv_event.error. This field is only for result data
     * in case of success. Most commands leave it at MPV_FORMAT_NONE. Set
     * to MPV_FORMAT_NONE on failure.
     */
    result: Node,
}

Event :: struct {
    /**
     * One of mpv_event. Keep in mind that later ABI compatible releases might
     * add new event types. These should be ignored by the API user.
     */
    event_id: Event_ID,
    /**
     * This is mainly used for events that are replies to (asynchronous)
     * requests. It contains a status code, which is >= 0 on success, or < 0
     * on error (a mpv_error value). Usually, this will be set if an
     * asynchronous request fails.
     * Used for:
     *  MPV_EVENT_GET_PROPERTY_REPLY
     *  MPV_EVENT_SET_PROPERTY_REPLY
     *  MPV_EVENT_COMMAND_REPLY
     */
    error: i32,
    /**
     * If the event is in reply to a request (made with this API and this
     * API handle), this is set to the reply_userdata parameter of the request
     * call. Otherwise, this field is 0.
     * Used for:
     *  MPV_EVENT_GET_PROPERTY_REPLY
     *  MPV_EVENT_SET_PROPERTY_REPLY
     *  MPV_EVENT_COMMAND_REPLY
     *  MPV_EVENT_PROPERTY_CHANGE
     *  MPV_EVENT_HOOK
     */
    reply_userdata: u64,
    /**
     * The meaning and contents of the data member depend on the event_id:
     *  MPV_EVENT_GET_PROPERTY_REPLY:     mpv_event_property*
     *  MPV_EVENT_PROPERTY_CHANGE:        mpv_event_property*
     *  MPV_EVENT_LOG_MESSAGE:            mpv_event_log_message*
     *  MPV_EVENT_CLIENT_MESSAGE:         mpv_event_client_message*
     *  MPV_EVENT_END_FILE:               mpv_event_end_file*
     *  MPV_EVENT_HOOK:                   mpv_event_hook*
     *  MPV_EVENT_COMMAND_REPLY*          mpv_event_command*
     *  other: NULL
     *
     * Note: future enhancements might add new event structs for existing or new
     *       event types.
     */
    data: rawptr,
}

@(default_calling_convention="c", link_prefix="mpv_")
foreign mpv_lib {
    /**
     * Enable or disable the given event.
     *
     * Some events are enabled by default. Some events can't be disabled.
     *
     * (Informational note: currently, all events are enabled by default, except
     *  MPV_EVENT_TICK.)
     *
     * Safe to be called from mpv render API threads.
     *
     * @param event See enum mpv_event_id.
     * @param enable 1 to enable receiving this event, 0 to disable it.
     * @return error code
     */
    request_event :: proc(ctx: ^Handle, event: Event_ID, enable: i32) -> i32 ---;

    /**
     * Enable or disable receiving of log messages. These are the messages the
     * command line player prints to the terminal. This call sets the minimum
     * required log level for a message to be received with MPV_EVENT_LOG_MESSAGE.
     *
     * @param min_level Minimal log level as string. Valid log levels:
     *                      no fatal error warn info v debug trace
     *                  The value "no" disables all messages. This is the default.
     *                  An exception is the value "terminal-default", which uses the
     *                  log level as set by the "--msg-level" option. This works
     *                  even if the terminal is disabled. (Since API version 1.19.)
     *                  Also see mpv_log_level.
     * @return error code
     */
    request_log_messages :: proc(ctx: ^Handle, min_level: cstring) -> i32 ---;

    /**
     * Wait for the next event, or until the timeout expires, or if another thread
     * makes a call to mpv_wakeup(). Passing 0 as timeout will never wait, and
     * is suitable for polling.
     *
     * The internal event queue has a limited size (per client handle). If you
     * don't empty the event queue quickly enough with mpv_wait_event(), it will
     * overflow and silently discard further events. If this happens, making
     * asynchronous requests will fail as well (with MPV_ERROR_EVENT_QUEUE_FULL).
     *
     * Only one thread is allowed to call this on the same mpv_handle at a time.
     * The API won't complain if more than one thread calls this, but it will cause
     * race conditions in the client when accessing the shared mpv_event struct.
     * Note that most other API functions are not restricted by this, and no API
     * function internally calls mpv_wait_event(). Additionally, concurrent calls
     * to different mpv_handles are always safe.
     *
     * As long as the timeout is 0, this is safe to be called from mpv render API
     * threads.
     *
     * @param timeout Timeout in seconds, after which the function returns even if
     *                no event was received. A MPV_EVENT_NONE is returned on
     *                timeout. A value of 0 will disable waiting. Negative values
     *                will wait with an infinite timeout.
     * @return A struct containing the event ID and other data. The pointer (and
     *         fields in the struct) stay valid until the next mpv_wait_event()
     *         call, or until the mpv_handle is destroyed. You must not write to
     *         the struct, and all memory referenced by it will be automatically
     *         released by the API on the next mpv_wait_event() call, or when the
     *         context is destroyed. The return value is never NULL.
     */
    wait_event :: proc(ctx: ^Handle, timeout: f64) -> ^Event ---;

    /**
     * Interrupt the current mpv_wait_event() call. This will wake up the thread
     * currently waiting in mpv_wait_event(). If no thread is waiting, the next
     * mpv_wait_event() call will return immediately (this is to avoid lost
     * wakeups).
     *
     * mpv_wait_event() will receive a MPV_EVENT_NONE if it's woken up due to
     * this call. But note that this dummy event might be skipped if there are
     * already other events queued. All what counts is that the waiting thread
     * is woken up at all.
     *
     * Safe to be called from mpv render API threads.
     */
    wakeup :: proc(ctx: ^Handle) ---;

    /**
     * Set a custom function that should be called when there are new events. Use
     * this if blocking in mpv_wait_event() to wait for new events is not feasible.
     *
     * Keep in mind that the callback will be called from foreign threads. You
     * must not make any assumptions of the environment, and you must return as
     * soon as possible (i.e. no long blocking waits). Exiting the callback through
     * any other means than a normal return is forbidden (no throwing exceptions,
     * no longjmp() calls). You must not change any local thread state (such as
     * the C floating point environment).
     *
     * You are not allowed to call any client API functions inside of the callback.
     * In particular, you should not do any processing in the callback, but wake up
     * another thread that does all the work. The callback is meant strictly for
     * notification only, and is called from arbitrary core parts of the player,
     * that make no considerations for reentrant API use or allowing the callee to
     * spend a lot of time doing other things. Keep in mind that it's also possible
     * that the callback is called from a thread while a mpv API function is called
     * (i.e. it can be reentrant).
     *
     * In general, the client API expects you to call mpv_wait_event() to receive
     * notifications, and the wakeup callback is merely a helper utility to make
     * this easier in certain situations. Note that it's possible that there's
     * only one wakeup callback invocation for multiple events. You should call
     * mpv_wait_event() with no timeout until MPV_EVENT_NONE is reached, at which
     * point the event queue is empty.
     *
     * If you actually want to do processing in a callback, spawn a thread that
     * does nothing but call mpv_wait_event() in a loop and dispatches the result
     * to a callback.
     *
     * Only one wakeup callback can be set.
     *
     * @param cb function that should be called if a wakeup is required
     * @param d arbitrary userdata passed to cb
     */
    set_wakeup_callback :: proc(ctx: ^Handle, cb: proc"c"(d: rawptr), d: rawptr) ---;

    /**
     * Block until all asynchronous requests are done. This affects functions like
     * mpv_command_async(), which return immediately and return their result as
     * events.
     *
     * This is a helper, and somewhat equivalent to calling mpv_wait_event() in a
     * loop until all known asynchronous requests have sent their reply as event,
     * except that the event queue is not emptied.
     *
     * In case you called mpv_suspend() before, this will also forcibly reset the
     * suspend counter of the given handle.
     */
    wait_async_requests :: proc(ctx: ^Handle) ---;

    /**
     * A hook is like a synchronous event that blocks the player. You register
     * a hook handler with this function. You will get an event, which you need
     * to handle, and once things are ready, you can let the player continue with
     * mpv_hook_continue().
     *
     * Currently, hooks can't be removed explicitly. But they will be implicitly
     * removed if the mpv_handle it was registered with is destroyed. This also
     * continues the hook if it was being handled by the destroyed mpv_handle (but
     * this should be avoided, as it might mess up order of hook execution).
     *
     * Hook handlers are ordered globally by priority and order of registration.
     * Handlers for the same hook with same priority are invoked in order of
     * registration (the handler registered first is run first). Handlers with
     * lower priority are run first (which seems backward).
     *
     * See the "Hooks" section in the manpage to see which hooks are currently
     * defined.
     *
     * Some hooks might be reentrant (so you get multiple MPV_EVENT_HOOK for the
     * same hook). If this can happen for a specific hook type, it will be
     * explicitly documented in the manpage.
     *
     * Only the mpv_handle on which this was called will receive the hook events,
     * or can "continue" them.
     *
     * @param reply_userdata This will be used for the mpv_event.reply_userdata
     *                       field for the received MPV_EVENT_HOOK events.
     *                       If you have no use for this, pass 0.
     * @param name The hook name. This should be one of the documented names. But
     *             if the name is unknown, the hook event will simply be never
     *             raised.
     * @param priority See remarks above. Use 0 as a neutral default.
     * @return error code (usually fails only on OOM)
     */
    hook_add :: proc(ctx: ^Handle, reply_userdata: u64, name: cstring, priority: i32) -> i32 ---;

    /**
     * Respond to a MPV_EVENT_HOOK event. You must call this after you have handled
     * the event. There is no way to "cancel" or "stop" the hook.
     *
     * Calling this will will typically unblock the player for whatever the hook
     * is responsible for (e.g. for the "on_load" hook it lets it continue
     * playback).
     *
     * It is explicitly undefined behavior to call this more than once for each
     * MPV_EVENT_HOOK, to pass an incorrect ID, or to call this on a mpv_handle
     * different from the one that registered the handler and received the event.
     *
     * @param id This must be the value of the mpv_event_hook.id field for the
     *           corresponding MPV_EVENT_HOOK.
     * @return error code
     */
    hook_continue :: proc(ctx: ^Handle, id: u64) -> i32 ---;

when #defined(MPV_ENABLE_DEPRECATED) {

    /**
     * Return a UNIX file descriptor referring to the read end of a pipe. This
     * pipe can be used to wake up a poll() based processing loop. The purpose of
     * this function is very similar to mpv_set_wakeup_callback(), and provides
     * a primitive mechanism to handle coordinating a foreign event loop and the
     * libmpv event loop. The pipe is non-blocking. It's closed when the mpv_handle
     * is destroyed. This function always returns the same value (on success).
     *
     * This is in fact implemented using the same underlying code as for
     * mpv_set_wakeup_callback() (though they don't conflict), and it is as if each
     * callback invocation writes a single 0 byte to the pipe. When the pipe
     * becomes readable, the code calling poll() (or select()) on the pipe should
     * read all contents of the pipe and then call mpv_wait_event(c, 0) until
     * no new events are returned. The pipe contents do not matter and can just
     * be discarded. There is not necessarily one byte per readable event in the
     * pipe. For example, the pipes are non-blocking, and mpv won't block if the
     * pipe is full. Pipes are normally limited to 4096 bytes, so if there are
     * more than 4096 events, the number of readable bytes can not equal the number
     * of events queued. Also, it's possible that mpv does not write to the pipe
     * once it's guaranteed that the client was already signaled. See the example
     * below how to do it correctly.
     *
     * Example:
     *
     *  int pipefd = mpv_get_wakeup_pipe(mpv);
     *  if (pipefd < 0)
     *      error();
     *  while (1) {
     *      struct pollfd pfds[1] = {
     *          { .fd = pipefd, .events = POLLIN },
     *      };
     *      // Wait until there are possibly new mpv events.
     *      poll(pfds, 1, -1);
     *      if (pfds[0].revents & POLLIN) {
     *          // Empty the pipe. Doing this before calling mpv_wait_event()
     *          // ensures that no wakeups are missed. It's not so important to
     *          // make sure the pipe is really empty (it will just cause some
     *          // additional wakeups in unlikely corner cases).
     *          char unused[256];
     *          read(pipefd, unused, sizeof(unused));
     *          while (1) {
     *              mpv_event *ev = mpv_wait_event(mpv, 0);
     *              // If MPV_EVENT_NONE is received, the event queue is empty.
     *              if (ev->event_id == MPV_EVENT_NONE)
     *                  break;
     *              // Process the event.
     *              ...
     *          }
     *      }
     *  }
     *
     * @deprecated this function will be removed in the future. If you need this
     *             functionality, use mpv_set_wakeup_callback(), create a pipe
     *             manually, and call write() on your pipe in the callback.
     *
     * @return A UNIX FD of the read end of the wakeup pipe, or -1 on error.
     *         On MS Windows/MinGW, this will always return -1.
     */
    get_wakeup_pipe :: proc(ctx: ^Handle) -> i32 ---;
} // when #defined(MPV_ENABLE_DEPRECATED)
}

when #defined(MPV_ENABLE_DEPRECATED) {
    /**
     * @deprecated use render.h
     */
    Sub_API :: enum u32 {
        /**
         * For using mpv's OpenGL renderer on an external OpenGL context.
         * mpv_get_sub_api(MPV_SUB_API_OPENGL_CB) returns mpv_opengl_cb_context*.
         * This context can be used with mpv_opengl_cb_* functions.
         * Will return NULL if unavailable (if OpenGL support was not compiled in).
         * See opengl_cb.h for details.
         *
         * @deprecated use render.h
         */
        OpenGL_CB = 1
    }
    @(default_calling_convention="c", link_prefix="mpv_")
    foreign mpv_lib {
        /**
         * This is used for additional APIs that are not strictly part of the core API.
         * See the individual mpv_sub_api member values.
         *
         * @deprecated use render.h
         */
        get_sub_api :: proc(ctx: ^Handle, sub_api: Sub_API) ---;
    }
}

//
// render.h
//

/**
 * Overview
 * --------
 *
 * This API can be used to make mpv render using supported graphic APIs (such
 * as OpenGL). It can be used to handle video display.
 *
 * The renderer needs to be created with mpv_render_context_create() before
 * you start playback (or otherwise cause a VO to be created). Then (with most
 * backends) mpv_render_context_render() can be used to explicitly render the
 * current video frame. Use mpv_render_context_set_update_callback() to get
 * notified when there is a new frame to draw.
 *
 * Preferably rendering should be done in a separate thread. If you call
 * normal libmpv API functions on the renderer thread, deadlocks can result
 * (these are made non-fatal with timeouts, but user experience will obviously
 * suffer). See "Threading" section below.
 *
 * You can output and embed video without this API by setting the mpv "wid"
 * option to a native window handle (see "Embedding the video window" section
 * in the client.h header). In general, using the render API is recommended,
 * because window embedding can cause various issues, especially with GUI
 * toolkits and certain platforms.
 *
 * Supported backends
 * ------------------
 *
 * OpenGL: via MPV_RENDER_API_TYPE_OPENGL, see render_gl.h header.
 *
 * Threading
 * ---------
 *
 * You are recommended to do rendering on a separate thread than normal libmpv
 * use.
 *
 * The mpv_render_* functions can be called from any thread, under the
 * following conditions:
 *  - only one of the mpv_render_* functions can be called at the same time
 *    (unless they belong to different mpv cores created by mpv_create())
 *  - never can be called from within the callbacks set with
 *    mpv_set_wakeup_callback() or mpv_render_context_set_update_callback()
 *  - if the OpenGL backend is used, for all functions the OpenGL context
 *    must be "current" in the calling thread, and it must be the same OpenGL
 *    context as the mpv_render_context was created with. Otherwise, undefined
 *    behavior will occur.
 *  - the thread does not call libmpv API functions other than the mpv_render_*
 *    functions, except APIs which are declared as safe (see below). Likewise,
 *    there must be no lock or wait dependency from the render thread to a
 *    thread using other libmpv functions. Basically, the situation that your
 *    render thread waits for a "not safe" libmpv API function to return must
 *    not happen. If you ignore this requirement, deadlocks can happen, which
 *    are made non-fatal with timeouts; then playback quality will be degraded,
 *    and the message
 *          mpv_render_context_render() not being called or stuck.
 *    is logged. If you set MPV_RENDER_PARAM_ADVANCED_CONTROL, you promise that
 *    this won't happen, and must absolutely guarantee it, or a real deadlock
 *    will freeze the mpv core thread forever.
 *
 * libmpv functions which are safe to call from a render thread are:
 *  - functions marked with "Safe to be called from mpv render API threads."
 *  - client.h functions which don't have an explicit or implicit mpv_handle
 *    parameter
 *  - mpv_render_* functions; but only for the same mpv_render_context pointer.
 *    If the pointer is different, mpv_render_context_free() is not safe. (The
 *    reason is that if MPV_RENDER_PARAM_ADVANCED_CONTROL is set, it may have
 *    to process still queued requests from the core, which it can do only for
 *    the current context, while requests for other contexts would deadlock.
 *    Also, it may have to wait and block for the core to terminate the video
 *    chain to make sure no resources are used after context destruction.)
 *  - if the mpv_handle parameter refers to a different mpv core than the one
 *    you're rendering for (very obscure, but allowed)
 *
 * Context and handle lifecycle
 * ----------------------------
 *
 * Video initialization will fail if the render context was not initialized yet
 * (with mpv_render_context_create()), or it will revert to a VO that creates
 * its own window.
 *
 * Currently, there can be only 1 mpv_render_context at a time per mpv core.
 *
 * Calling mpv_render_context_free() while a VO is using the render context is
 * active will disable video.
 *
 * You must free the context with mpv_render_context_free() before the mpv core
 * is destroyed. If this doesn't happen, undefined behavior will result.
 */

/**
 * Opaque context, returned by mpv_render_context_create().
 */
Render_Context :: struct{};

/**
 * Parameters for mpv_render_param (which is used in a few places such as
 * mpv_render_context_create().
 *
 * Also see mpv_render_param for conventions and how to use it.
 */
Render_Param_Type :: enum u32 {
    /**
     * Not a valid value, but also used to terminate a params array. Its value
     * is always guaranteed to be 0 (even if the ABI changes in the future).
     */
    Invalid = 0,
    /**
     * The render API to use. Valid for mpv_render_context_create().
     *
     * Type: char*
     *
     * Defined APIs:
     *
     *   MPV_RENDER_API_TYPE_OPENGL:
     *      OpenGL desktop 2.1 or later (preferably core profile compatible to
     *      OpenGL 3.2), or OpenGLES 2.0 or later.
     *      Providing MPV_RENDER_PARAM_OPENGL_INIT_PARAMS is required.
     *      It is expected that an OpenGL context is valid and "current" when
     *      calling mpv_render_* functions (unless specified otherwise). It
     *      must be the same context for the same mpv_render_context.
     */
    API_Type = 1,
    /**
     * Required parameters for initializing the OpenGL renderer. Valid for
     * mpv_render_context_create().
     * Type: mpv_opengl_init_params*
     */
    OpenGL_Init_Params = 2,
    /**
     * Describes a GL render target. Valid for mpv_render_context_render().
     * Type: mpv_opengl_fbo*
     */
    OpenGL_FBO = 3,
    /**
     * Control flipped rendering. Valid for mpv_render_context_render().
     * Type: int*
     * If the value is set to 0, render normally. Otherwise, render it flipped,
     * which is needed e.g. when rendering to an OpenGL default framebuffer
     * (which has a flipped coordinate system).
     */
    Flip_Y = 4,
    /**
     * Control surface depth. Valid for mpv_render_context_render().
     * Type: int*
     * This implies the depth of the surface passed to the render function in
     * bits per channel. If omitted or set to 0, the renderer will assume 8.
     * Typically used to control dithering.
     */
    Depth = 5,
    /**
     * ICC profile blob. Valid for mpv_render_context_set_parameter().
     * Type: mpv_byte_array*
     * Set an ICC profile for use with the "icc-profile-auto" option. (If the
     * option is not enabled, the ICC data will not be used.)
     */
    ICC_Profile = 6,
    /**
     * Ambient light in lux. Valid for mpv_render_context_set_parameter().
     * Type: int*
     * This can be used for automatic gamma correction.
     */
    Ambient_Light = 7,
    /**
     * X11 Display, sometimes used for hwdec. Valid for
     * mpv_render_context_create(). The Display must stay valid for the lifetime
     * of the mpv_render_context.
     * Type: Display*
     */
    X11_Display = 8,
    /**
     * Wayland display, sometimes used for hwdec. Valid for
     * mpv_render_context_create(). The wl_display must stay valid for the
     * lifetime of the mpv_render_context.
     * Type: struct wl_display*
     */
    WL_Display = 9,
    /**
     * Better control about rendering and enabling some advanced features. Valid
     * for mpv_render_context_create().
     *
     * This conflates multiple requirements the API user promises to abide if
     * this option is enabled:
     *
     *  - The API user's render thread, which is calling the mpv_render_*()
     *    functions, never waits for the core. Otherwise deadlocks can happen.
     *    See "Threading" section.
     *  - The callback set with mpv_render_context_set_update_callback() can now
     *    be called even if there is no new frame. The API user should call the
     *    mpv_render_context_update() function, and interpret the return value
     *    for whether a new frame should be rendered.
     *  - Correct functionality is impossible if the update callback is not set,
     *    or not set soon enough after mpv_render_context_create() (the core can
     *    block while waiting for you to call mpv_render_context_update(), and
     *    if the update callback is not correctly set, it will deadlock, or
     *    block for too long).
     *
     * In general, setting this option will enable the following features (and
     * possibly more):
     *
     *  - "Direct rendering", which means the player decodes directly to a
     *    texture, which saves a copy per video frame ("vd-lavc-dr" option
     *    needs to be enabled, and the rendering backend as well as the
     *    underlying GPU API/driver needs to have support for it).
     *  - Rendering screenshots with the GPU API if supported by the backend
     *    (instead of using a suboptimal software fallback via libswscale).
     *
     * Type: int*: 0 for disable (default), 1 for enable
     */
    Advanced_Control = 10,
    /**
     * Return information about the next frame to render. Valid for
     * mpv_render_context_get_info().
     *
     * Type: mpv_render_frame_info*
     *
     * It strictly returns information about the _next_ frame. The implication
     * is that e.g. mpv_render_context_update()'s return value will have
     * MPV_RENDER_UPDATE_FRAME set, and the user is supposed to call
     * mpv_render_context_render(). If there is no next frame, then the
     * return value will have is_valid set to 0.
     */
    Next_Frame_Info = 11,
    /**
     * Enable or disable video timing. Valid for mpv_render_context_render().
     *
     * Type: int*: 0 for disable, 1 for enable (default)
     *
     * When video is timed to audio, the player attempts to render video a bit
     * ahead, and then do a blocking wait until the target display time is
     * reached. This blocks mpv_render_context_render() for up to the amount
     * specified with the "video-timing-offset" global option. You can set
     * this parameter to 0 to disable this kind of waiting. If you do, it's
     * recommended to use the target time value in mpv_render_frame_info to
     * wait yourself, or to set the "video-timing-offset" to 0 instead.
     *
     * Disabling this without doing anything in addition will result in A/V sync
     * being slightly off.
     */
    Block_For_Target_Time = 12,
    /**
     * Use to skip rendering in mpv_render_context_render().
     *
     * Type: int*: 0 for rendering (default), 1 for skipping
     *
     * If this is set, you don't need to pass a target surface to the render
     * function (and if you do, it's completely ignored). This can still call
     * into the lower level APIs (i.e. if you use OpenGL, the OpenGL context
     * must be set).
     *
     * Be aware that the render API will consider this frame as having been
     * rendered. All other normal rules also apply, for example about whether
     * you have to call mpv_render_context_report_swap(). It also does timing
     * in the same way.
     */
    Skip_Rendering = 13,
    /**
     * DRM display, contains drm display handles.
     * Valid for mpv_render_context_create().
     * Type : struct mpv_opengl_drm_params*
     */
    DRM_Display = 14,
    /**
     * DRM draw surface size, contains draw surface dimensions.
     * Valid for mpv_render_context_create().
     * Type : struct mpv_opengl_drm_draw_surface_size*
     */
    DRM_Draw_Surface_Size = 15,
}

/**
 * For backwards compatibility with the old naming of
 * MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE
 */
Render_Param_DRM_OSD_Size :: Render_Param_Type.DRM_Draw_Surface_Size;

/**
 * Used to pass arbitrary parameters to some mpv_render_* functions. The
 * meaning of the data parameter is determined by the type, and each
 * MPV_RENDER_PARAM_* documents what type the value must point to.
 *
 * Each value documents the required data type as the pointer you cast to
 * void* and set on mpv_render_param.data. For example, if MPV_RENDER_PARAM_FOO
 * documents the type as Something* , then the code should look like this:
 *
 *   Something foo = {...};
 *   mpv_render_param param;
 *   param.type = MPV_RENDER_PARAM_FOO;
 *   param.data = & foo;
 *
 * Normally, the data field points to exactly 1 object. If the type is char*,
 * it points to a 0-terminated string.
 *
 * In all cases (unless documented otherwise) the pointers need to remain
 * valid during the call only. Unless otherwise documented, the API functions
 * will not write to the params array or any data pointed to it.
 *
 * As a convention, parameter arrays are always terminated by type==0. There
 * is no specific order of the parameters required. The order of the 2 fields in
 * this struct is guaranteed (even after ABI changes).
 */
Render_Param :: struct {
    type: Render_Param_Type,
    data: rawptr,
}

/**
 * Predefined values for MPV_RENDER_PARAM_API_TYPE.
 */
_A_STRING_THAT_JUST_SAYS_OPENGL: cstring = "opengl";
RENDER_API_TYPE_OPENGL := cast(rawptr) _A_STRING_THAT_JUST_SAYS_OPENGL;

/**
 * Flags used in mpv_render_frame_info.flags. Each value represents a bit in it.
 */
Render_Frame_Info_Flag :: enum u32 {
    /**
     * Set if there is actually a next frame. If unset, there is no next frame
     * yet, and other flags and fields that require a frame to be queued will
     * be unset.
     *
     * This is set for _any_ kind of frame, even for redraw requests.
     *
     * Note that when this is unset, it simply means no new frame was
     * decoded/queued yet, not necessarily that the end of the video was
     * reached. A new frame can be queued after some time.
     *
     * If the return value of mpv_render_context_render() had the
     * MPV_RENDER_UPDATE_FRAME flag set, this flag will usually be set as well,
     * unless the frame is rendered, or discarded by other asynchronous events.
     */
    Present         = 1 << 0,
    /**
     * If set, the frame is not an actual new video frame, but a redraw request.
     * For example if the video is paused, and an option that affects video
     * rendering was changed (or any other reason), an update request can be
     * issued and this flag will be set.
     *
     * Typically, redraw frames will not be subject to video timing.
     *
     * Implies MPV_RENDER_FRAME_INFO_PRESENT.
     */
    Rendraw          = 1 << 1,
    /**
     * If set, this is supposed to reproduce the previous frame perfectly. This
     * is usually used for certain "video-sync" options ("display-..." modes).
     * Typically the renderer will blit the video from a FBO. Unset otherwise.
     *
     * Implies MPV_RENDER_FRAME_INFO_PRESENT.
     */
    Repeat          = 1 << 2,
    /**
     * If set, the player timing code expects that the user thread blocks on
     * vsync (by either delaying the render call, or by making a call to
     * mpv_render_context_report_swap() at vsync time).
     *
     * Implies MPV_RENDER_FRAME_INFO_PRESENT.
     */
    Block_VSync     = 1 << 3,
}

/**
 * Information about the next video frame that will be rendered. Can be
 * retrieved with MPV_RENDER_PARAM_NEXT_FRAME_INFO.
 */
Render_Frame_Info :: struct {
    /**
     * A bitset of mpv_render_frame_info_flag values (i.e. multiple flags are
     * combined with bitwise or).
     */
    flags: u64,
    /**
     * Absolute time at which the frame is supposed to be displayed. This is in
     * the same unit and base as the time returned by mpv_get_time_us(). For
     * frames that are redrawn, or if vsync locked video timing is used (see
     * "video-sync" option), then this can be 0. The "video-timing-offset"
     * option determines how much "headroom" the render thread gets (but a high
     * enough frame rate can reduce it anyway). mpv_render_context_render() will
     * normally block until the time is elapsed, unless you pass it
     * MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME = 0.
     */
    target_time: i64,
}

@(default_calling_convention="c", link_prefix="mpv_")
foreign mpv_lib {
    /**
     * Initialize the renderer state. Depending on the backend used, this will
     * access the underlying GPU API and initialize its own objects.
     *
     * You must free the context with mpv_render_context_free(). Not doing so before
     * the mpv core is destroyed may result in memory leaks or crashes.
     *
     * Currently, only at most 1 context can exists per mpv core (it represents the
     * main video output).
     *
     * You should pass the following parameters:
     *  - MPV_RENDER_PARAM_API_TYPE to select the underlying backend/GPU API.
     *  - Backend-specific init parameter, like MPV_RENDER_PARAM_OPENGL_INIT_PARAMS.
     *  - Setting MPV_RENDER_PARAM_ADVANCED_CONTROL and following its rules is
     *    strongly recommended.
     *  - If you want to use hwdec, possibly hwdec interop resources.
     *
     * @param res set to the context (on success) or NULL (on failure). The value
     *            is never read and always overwritten.
     * @param mpv handle used to get the core (the mpv_render_context won't depend
     *            on this specific handle, only the core referenced by it)
     * @param params an array of parameters, terminated by type==0. It's left
     *               unspecified what happens with unknown parameters. At least
     *               MPV_RENDER_PARAM_API_TYPE is required, and most backends will
     *               require another backend-specific parameter.
     * @return error code, including but not limited to:
     *      MPV_ERROR_UNSUPPORTED: the OpenGL version is not supported
     *                             (or required extensions are missing)
     *      MPV_ERROR_NOT_IMPLEMENTED: an unknown API type was provided, or
     *                                 support for the requested API was not
     *                                 built in the used libmpv binary.
     *      MPV_ERROR_INVALID_PARAMETER: at least one of the provided parameters was
     *                                   not valid.
     */
    render_context_create :: proc(res: ^^Render_Context, mpv: ^Handle, params: ^Render_Param) -> i32 ---;

    /**
     * Attempt to change a single parameter. Not all backends and parameter types
     * support all kinds of changes.
     *
     * @param ctx a valid render context
     * @param param the parameter type and data that should be set
     * @return error code. If a parameter could actually be changed, this returns
     *         success, otherwise an error code depending on the parameter type
     *         and situation.
     */
    render_context_set_parameter :: proc(ctx: ^Render_Context, param: Render_Param) -> i32 ---;

    /**
     * Retrieve information from the render context. This is NOT a counterpart to
     * mpv_render_context_set_parameter(), because you generally can't read
     * parameters set with it, and this function is not meant for this purpose.
     * Instead, this is for communicating information from the renderer back to the
     * user. See mpv_render_param_type; entries which support this function
     * explicitly mention it, and for other entries you can assume it will fail.
     *
     * You pass param with param.type set and param.data pointing to a variable
     * of the required data type. The function will then overwrite that variable
     * with the returned value (at least on success).
     *
     * @param ctx a valid render context
     * @param param the parameter type and data that should be retrieved
     * @return error code. If a parameter could actually be retrieved, this returns
     *         success, otherwise an error code depending on the parameter type
     *         and situation. MPV_ERROR_NOT_IMPLEMENTED is used for unknown
     *         param.type, or if retrieving it is not supported.
     */
    render_context_get_info :: proc(ctx: ^Render_Context, param: Render_Param) -> i32 ---;

    /**
     * Set the callback that notifies you when a new video frame is available, or
     * if the video display configuration somehow changed and requires a redraw.
     * Similar to mpv_set_wakeup_callback(), you must not call any mpv API from
     * the callback, and all the other listed restrictions apply (such as not
     * exiting the callback by throwing exceptions).
     *
     * This can be called from any thread, except from an update callback. In case
     * of the OpenGL backend, no OpenGL state or API is accessed.
     *
     * Calling this will raise an update callback immediately.
     *
     * @param callback callback(callback_ctx) is called if the frame should be
     *                 redrawn
     * @param callback_ctx opaque argument to the callback
     */
    render_context_set_update_callback :: proc(ctx: ^Render_Context, callback: proc"c"(callback_ctx: rawptr), callback_ctx: rawptr) ---;

    /**
     * The API user is supposed to call this when the update callback was invoked
     * (like all mpv_render_* functions, this has to happen on the render thread,
     * and _not_ from the update callback itself).
     *
     * This is optional if MPV_RENDER_PARAM_ADVANCED_CONTROL was not set (default).
     * Otherwise, it's a hard requirement that this is called after each update
     * callback. If multiple update callback happened, and the function could not
     * be called sooner, it's OK to call it once after the last callback.
     *
     * If an update callback happens during or after this function, the function
     * must be called again at the soonest possible time.
     *
     * If MPV_RENDER_PARAM_ADVANCED_CONTROL was set, this will do additional work
     * such as allocating textures for the video decoder.
     *
     * @return a bitset of mpv_render_update_flag values (i.e. multiple flags are
     *         combined with bitwise or). Typically, this will tell the API user
     *         what should happen next. E.g. if the MPV_RENDER_UPDATE_FRAME flag is
     *         set, mpv_render_context_render() should be called. If flags unknown
     *         to the API user are set, or if the return value is 0, nothing needs
     *         to be done.
     */
    render_context_update :: proc(ctx: ^Render_Context) -> u64 ---;
}

/**
 * Flags returned by mpv_render_context_update(). Each value represents a bit
 * in the function's return value.
 */
Render_Update_Flag :: enum u32 {
    /**
     * A new video frame must be rendered. mpv_render_context_render() must be
     * called.
     */
    Frame         = 1 << 0,
}

@(default_calling_convention="c", link_prefix="mpv_")
foreign mpv_lib {
    /**
     * Render video.
     *
     * Typically renders the video to a target surface provided via mpv_render_param
     * (the details depend on the backend in use). Options like "panscan" are
     * applied to determine which part of the video should be visible and how the
     * video should be scaled. You can change these options at runtime by using the
     * mpv property API.
     *
     * The renderer will reconfigure itself every time the target surface
     * configuration (such as size) is changed.
     *
     * This function implicitly pulls a video frame from the internal queue and
     * renders it. If no new frame is available, the previous frame is redrawn.
     * The update callback set with mpv_render_context_set_update_callback()
     * notifies you when a new frame was added. The details potentially depend on
     * the backends and the provided parameters.
     *
     * Generally, libmpv will invoke your update callback some time before the video
     * frame should be shown, and then lets this function block until the supposed
     * display time. This will limit your rendering to video FPS. You can prevent
     * this by setting the "video-timing-offset" global option to 0. (This applies
     * only to "audio" video sync mode.)
     *
     * You should pass the following parameters:
     *  - Backend-specific target object, such as MPV_RENDER_PARAM_OPENGL_FBO.
     *  - Possibly transformations, such as MPV_RENDER_PARAM_FLIP_Y.
     *
     * @param ctx a valid render context
     * @param params an array of parameters, terminated by type==0. Which parameters
     *               are required depends on the backend. It's left unspecified what
     *               happens with unknown parameters.
     * @return error code
     */
    render_context_render :: proc(ctx: ^Render_Context, params: ^Render_Param) -> i32 ---;

    /**
     * Tell the renderer that a frame was flipped at the given time. This is
     * optional, but can help the player to achieve better timing.
     *
     * Note that calling this at least once informs libmpv that you will use this
     * function. If you use it inconsistently, expect bad video playback.
     *
     * If this is called while no video is initialized, it is ignored.
     *
     * @param ctx a valid render context
     */
    render_context_report_swap :: proc(ctx: ^Render_Context) ---;

    /**
     * Destroy the mpv renderer state.
     *
     * If video is still active (e.g. a file playing), video will be disabled
     * forcefully.
     *
     * @param ctx a valid render context. After this function returns, this is not
     *            a valid pointer anymore. NULL is also allowed and does nothing.
     */
    render_context_free :: proc(ctx: ^Render_Context) ---;
}

//
// render_gl.h
//

/**
 * OpenGL backend
 * --------------
 *
 * This header contains definitions for using OpenGL with the render.h API.
 *
 * OpenGL interop
 * --------------
 *
 * The OpenGL backend has some special rules, because OpenGL itself uses
 * implicit per-thread contexts, which causes additional API problems.
 *
 * This assumes the OpenGL context lives on a certain thread controlled by the
 * API user. All mpv_render_* APIs have to be assumed to implicitly use the
 * OpenGL context if you pass a mpv_render_context using the OpenGL backend,
 * unless specified otherwise.
 *
 * The OpenGL context is indirectly accessed through the OpenGL function
 * pointers returned by the get_proc_address callback in mpv_opengl_init_params.
 * Generally, mpv will not load the system OpenGL library when using this API.
 *
 * OpenGL state
 * ------------
 *
 * OpenGL has a large amount of implicit state. All the mpv functions mentioned
 * above expect that the OpenGL state is reasonably set to OpenGL standard
 * defaults. Likewise, mpv will attempt to leave the OpenGL context with
 * standard defaults. The following state is excluded from this:
 *
 *      - the glViewport state
 *      - the glScissor state (but GL_SCISSOR_TEST is in its default value)
 *      - glBlendFuncSeparate() state (but GL_BLEND is in its default value)
 *      - glClearColor() state
 *      - mpv may overwrite the callback set with glDebugMessageCallback()
 *      - mpv always disables GL_DITHER at init
 *
 * Messing with the state could be avoided by creating shared OpenGL contexts,
 * but this is avoided for the sake of compatibility and interoperability.
 *
 * On OpenGL 2.1, mpv will strictly call functions like glGenTextures() to
 * create OpenGL objects. You will have to do the same. This ensures that
 * objects created by mpv and the API users don't clash. Also, legacy state
 * must be either in its defaults, or not interfere with core state.
 *
 * API use
 * -------
 *
 * The mpv_render_* API is used. That API supports multiple backends, and this
 * section documents specifics for the OpenGL backend.
 *
 * Use mpv_render_context_create() with MPV_RENDER_PARAM_API_TYPE set to
 * MPV_RENDER_API_TYPE_OPENGL, and MPV_RENDER_PARAM_OPENGL_INIT_PARAMS provided.
 *
 * Call mpv_render_context_render() with MPV_RENDER_PARAM_OPENGL_FBO to render
 * the video frame to an FBO.
 *
 * Hardware decoding
 * -----------------
 *
 * Hardware decoding via this API is fully supported, but requires some
 * additional setup. (At least if direct hardware decoding modes are wanted,
 * instead of copying back surface data from GPU to CPU RAM.)
 *
 * There may be certain requirements on the OpenGL implementation:
 *
 * - Windows: ANGLE is required (although in theory GL/DX interop could be used)
 * - Intel/Linux: EGL is required, and also the native display resource needs
 *                to be provided (e.g. MPV_RENDER_PARAM_X11_DISPLAY for X11 and
 *                MPV_RENDER_PARAM_WL_DISPLAY for Wayland)
 * - nVidia/Linux: Both GLX and EGL should work (GLX is required if vdpau is
 *                 used, e.g. due to old drivers.)
 * - OSX: CGL is required (CGLGetCurrentContext() returning non-NULL)
 * - iOS: EAGL is required (EAGLContext.currentContext returning non-nil)
 *
 * Once these things are setup, hardware decoding can be enabled/disabled at
 * any time by setting the "hwdec" property.
 */

/**
 * For initializing the mpv OpenGL state via MPV_RENDER_PARAM_OPENGL_INIT_PARAMS.
 */
OpenGL_Init_Params :: struct {
    /**
     * This retrieves OpenGL function pointers, and will use them in subsequent
     * operation.
     * Usually, you can simply call the GL context APIs from this callback (e.g.
     * glXGetProcAddressARB or wglGetProcAddress), but some APIs do not always
     * return pointers for all standard functions (even if present); in this
     * case you have to compensate by looking up these functions yourself when
     * libmpv wants to resolve them through this callback.
     * libmpv will not normally attempt to resolve GL functions on its own, nor
     * does it link to GL libraries directly.
     */
    get_proc_address: proc"c"(ctx: rawptr, name: cstring) -> rawptr,
    /**
     * Value passed as ctx parameter to get_proc_address().
     */
    get_proc_address_ctx: rawptr,
    /**
     * This should not be used. It is deprecated and will be removed or ignored
     * when the opengl_cb API is removed.
     */
    extra_exts: cstring,
}

/**
 * For MPV_RENDER_PARAM_OPENGL_FBO.
 */
OpenGL_FBO :: struct {
    /**
     * Framebuffer object name. This must be either a valid FBO generated by
     * glGenFramebuffers() that is complete and color-renderable, or 0. If the
     * value is 0, this refers to the OpenGL default framebuffer.
     */
    fbo: i32,
    /**
     * Valid dimensions. This must refer to the size of the framebuffer. This
     * must always be set.
     */
    w, h: i32,
    /**
     * Underlying texture internal format (e.g. GL_RGBA8), or 0 if unknown. If
     * this is the default framebuffer, this can be an equivalent.
     */
    internal_format: i32,
}

/**
 * For MPV_RENDER_PARAM_DRM_DISPLAY.
 */
OpenGL_DRM_Params :: struct {
    /**
     * DRM fd (int). Set to a negative number if invalid.
     */
    fd: i32,

    /**
     * Currently used crtc id
     */
    crtc_id: i32,

    /**
     * Currently used connector id
     */
    connector_id: i32,

    /**
     * Pointer to a drmModeAtomicReq pointer that is being used for the renderloop.
     * This pointer should hold a pointer to the atomic request pointer
     * The atomic request pointer is usually changed at every renderloop.
     */
    atomic_request_ptr: ^^struct{},

    /**
     * DRM render node. Used for VAAPI interop.
     * Set to a negative number if invalid.
     */
    render_fd: i32,
}

/**
 * For MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE.
 */
OpenGL_DRM_Draw_Surface_Size :: struct {
    /**
     * size of the draw plane surface in pixels.
     */
    width, height: i32,
};

/**
 * For backwards compatibility with the old naming of mpv_opengl_drm_draw_surface_size
 */
OpenGL_DRM_OSD_Size :: OpenGL_DRM_Draw_Surface_Size;