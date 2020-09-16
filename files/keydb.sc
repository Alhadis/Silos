/*
 * Copyright (C) 2016 Cybernetica
 *
 * Research/Commercial License Usage
 * Licensees holding a valid Research License or Commercial License
 * for the Software may use this file according to the written
 * agreement between you and Cybernetica.
 *
 * GNU Lesser General Public License Usage
 * Alternatively, this file may be used under the terms of the GNU Lesser
 * General Public License version 3 as published by the Free Software
 * Foundation and appearing in the file LICENSE.LGPLv3 included in the
 * packaging of this file.  Please review the following information to
 * ensure the GNU Lesser General Public License version 3 requirements
 * will be met: http://www.gnu.org/licenses/lgpl-3.0.html.
 *
 * For further information, please contact us at sharemind@cyber.ee.
 */

/** \cond */
module keydb;

import stdlib;
/** \endcond */

/** @file
 *  \defgroup keydb keydb.sc
 *  \defgroup keydb_connect keydb_connect(string)
 *  \defgroup keydb_disconnect keydb_disconnect(void)
 *  \defgroup keydb_del keydb_del(string)
 *  \defgroup keydb_get keydb_get(string)
 *  \defgroup keydb_set keydb_set(string, value)
 *  \defgroup keydb_scan keydb_scan(string)
 *  \defgroup keydb_scan_next keydb_scan_next(cursor)
 *  \defgroup keydb_scan_cursor_free keydb_scan_cursor_free(cursor)
 */

/** \addtogroup keydb
 *  @{
 *  @brief Module for working with key-value database.
 */

/** \addtogroup keydb_connect
 *  @{
 *  @brief Connect to a Redis host.
 *  @param host - the name of the host to connect to. Must match one in the
 *  module configuration.
 */
void keydb_connect(string host) {
    __syscall ("keydb_connect", __cref host);
}
/** @} */

/** \addtogroup keydb_disconnect
 *  @{
 *  @brief Disconnect from a Redis host.
 */
void keydb_disconnect() {
    __syscall ("keydb_disconnect");
}
/** @} */

/** \addtogroup keydb_del
 *  @{
 *  @brief Delete a value from the database.
 *  @param key - the public key of the value to be deleted.
 */
void keydb_del(string key) {
    __syscall ("keydb_del", __cref key);
}
/** @} */

/** \addtogroup keydb_get
 *  @{
 *  @brief Get value stored in database.
 *  @note **T** - any \ref data_types "data" type
 *  @param key - the public key of the value.
 *  @return the value stored in the database.
 */
template <type T>
T keydb_get(string key) {
    uint num_bytes;
    uint obj;
    T dummy;
    uint t_size = sizeof(dummy);
    __syscall("keydb_get_size", obj, __cref key, __return num_bytes);
    assert(num_bytes == t_size);
    T out;
    __syscall("keydb_get", obj, __ref out);
    return out;
}

template <type T>
T[[1]] keydb_get(string key) {
    uint num_bytes;
    uint obj;
    T dummy;
    uint t_size = sizeof(dummy);
    __syscall("keydb_get_size", obj, __cref key, __return num_bytes);
    assert(num_bytes % t_size == 0);
    T[[1]] out(num_bytes / t_size);
    __syscall("keydb_get", obj, __ref out);
    return out;
}
/** @} */

/** \addtogroup keydb_set
 *  @{
 *  @brief Store a new value in the database.
 *  @note **T** - any \ref data_types "data" type
 *  @param key - the public key of the value.
 *  @param value - the value to store.
 */
template <type T>
void keydb_set(string key, T value) {
    uint64 array = 0;
    __syscall("keydb_set", array,  __cref key, __cref value);
}

template <type T>
void keydb_set(string key, T[[1]] value) {
    uint64 array = 1;
    __syscall("keydb_set", array, __cref key, __cref value);
}
/** @} */

/** \addtogroup keydb_scan
 *  @{
 *  @brief Start a scan of all the keys stored in the database.
 *  @param pattern - operate only on keys matching to the pattern. The pattern is the same
 *   as accepted by Redis in the KEYS and SCAN command. (http://redis.io/commands/keys)
 *  @return a \ref ScanCursor "ScanCursor" which holds the key and a cursor.
 *
 *  Internally this will call \ref keydb_clean "keydb_clean" to make sure only
 *  existing keys are returned from the scan.
 */
ScanCursor keydb_scan(string pattern) {
    uint64 cursor;
    uint64 nextKeySize;
    __syscall("keydb_scan",
              __cref pattern,
              __ref nextKeySize,
              __return cursor);
    if (cursor != 0) {
        // assert(nextKeySize > 0);
        uint8[[1]] firstKey(nextKeySize);
        __syscall("keydb_scan_cursor_pop",
                  cursor,
                  __ref firstKey,
                  __return nextKeySize);
        ScanCursor sc;
        sc.cursor = cursor;
        sc.nextKeySize = nextKeySize;
        sc.key = __string_from_bytes(firstKey);
        return sc;
    } else {
        ScanCursor sc;
        return sc;
    }
}
/** @} */

/** \addtogroup keydb_scan_next
 *  @{
 *  @brief Scan the next key from a database.
 *  @param sc the cursor returned by previous call to \ref keydb_scan "keydb_scan"
 *   or \ref keydb_scan_next "keydb_scan_next".
 *  @return a \ref ScanCursor "ScanCursor" which holds the key and a cursor.
 */
ScanCursor keydb_scan_next(ScanCursor sc) {
    if (sc.nextKeySize > 0) {
        uint64 newNextKeySize;
        uint8[[1]] newKey(sc.nextKeySize);
        __syscall("keydb_scan_cursor_pop",
                  sc.cursor,
                  __ref newKey,
                  __return newNextKeySize);
        sc.key = __string_from_bytes(newKey);
        sc.nextKeySize = newNextKeySize;
    } else {
        sc.cursor = 0;
        sc.key = "";
    }
    return sc;
}
/** @} */

/** \addtogroup keydb_scan_cursor_free
 *  @{
 *  @brief Deallocates the given cursor without popping all the elements.
 *  @param sc - the cursor returned by previous call to \ref keydb_scan "keydb_scan"
 *   or \ref keydb_scan_next "keydb_scan_next".
 */
void keydb_scan_cursor_free(ScanCursor sc) {
    if (sc.cursor != 0)
        __syscall("keydb_scan_cursor_free", sc.cursor);
}
/** @} */



/** \addtogroup keydb_clean
 *  @{
 *  @brief Removes partially stored keys from the database.
 *  @param pattern - operate only on keys matching to the pattern. The pattern is the same
 *   as accepted by Redis in the KEYS and SCAN command. (http://redis.io/commands/keys)
 *  @return the result of consensus operation. True, when everything went fine,
 *   False on consensus error.
 */
bool keydb_clean(string pattern) {
    bool ok;
    __syscall("keydb_clean", __cref pattern, __return ok);
    return ok;
}
/** @} */

/** \addtogroup ScanCursor
 *  @{
 *  @brief Structure for keydb_scan.
 */
struct ScanCursor {
    uint64 cursor;
    uint64 nextKeySize; /** @brief When non-zero, keydb_scan_next can be called. */
    string key; /** @brief Holds the returned key. */
}
/** @} */

/** @} */
