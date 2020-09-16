import stdlib;
import keydb;
import shared3p;
import shared3p_keydb;

domain pd_shared3p shared3p;

void scanDB(string pattern) {
    ScanCursor sc = keydb_scan(pattern);
    while(sc.cursor != 0) {
        print(sc.key);
        sc = keydb_scan_next(sc);
    }
}

void deleteFromDB(string pattern) {
    ScanCursor sc = keydb_scan(pattern);
    while(sc.cursor != 0) {
        print("Deleting key: ", sc.key);
        keydb_del(sc.key);
        sc = keydb_scan_next(sc);
    }
}

void main() {

    // Database host name as per module configuration
    string host = "host";

    // Open database before running operations on it
    keydb_connect(host);

    // Delete everything from the database
    deleteFromDB("*");

    // Insert data entries
    uint scalar = 123;
    uint[[1]] array = {10, 20, 30, 40, 50};
    pd_shared3p uint pd_scalar = 1337;
    pd_shared3p uint[[1]] pd_array = {100, 200, 300, 400, 500};

    keydb_set("my_scalar", scalar);
    keydb_set("my_array", array);
    keydb_set("my_pd_scalar", pd_scalar);
    keydb_set("my_pd_array", pd_array);

    print("Set my_scalar: ", scalar);
    print("Set my_array: ", _vectorToString(array));
    print("Set my_pd_scalar: ", declassify(pd_scalar));
    print("Set my_pd_array: ", _vectorToString(declassify(pd_array)));

    // Clean up partially stored values across the Sharemind servers.
    // keydb_clean removes inconsistencies in the distributed database that can occur:
    // 1. if input data from external sources, e.g. main arguments, is errorneous.
    // 2. if some of the servers experience an error during data processing.
    assert(keydb_clean("*"));

    // Scan and print all keys in the database
    print("Keys set in the database:");
    scanDB("*");

    // Get and print individual keys and values in the database
    uint my_scalar = keydb_get("my_scalar");
    uint[[1]] my_array =  keydb_get("my_array");
    pd_shared3p uint my_pd_scalar =  keydb_get("my_pd_scalar");
    pd_shared3p uint[[1]] my_pd_array =  keydb_get("my_pd_array");

    print("Get my_scalar: ", my_scalar);
    print("Get my_array: ", _vectorToString(my_array));
    print("Get my_pd_scalar: ", declassify(my_pd_scalar));
    print("Get my_pd_array: ", _vectorToString(declassify(my_pd_array)));

    // Close the database.
    keydb_disconnect();
}
