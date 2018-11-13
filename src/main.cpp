#include <cstdarg>
#include <cstdbool>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include <vector>

void cleanup();

void error(const char *format...) {
    va_list argp;
    va_start(argp, format);
    
    vfprintf(stderr, format, argp);
    
    va_end(argp);
}

[[noreturn]] void quit(const char *message) {
    error("FATAL ERROR: %s\n", message);
    
    cleanup();
    exit(1);
}

#define TMPDIR "/tmp"

int main(int argc, char **argv) {
    bool objOut = false;
    char *outName = "";
    std::vector<char*> inNames;
    
    for(int i = 1; i < argc; i++) {
        if(strcmp("-c", argv[i]) == 0) objOut = true;
        else if(strcmp("-o", argv[i]) == 0) {
            i++;
            if(i == argc) quit("missing filename after '-o'");
        } else {
            inNames.push_back(argv[i]);
        }
    }
    
    if(outName[0] == '\0') { // didn't get set
        if(!objOut) {
            outName = "a.out";
        }
    }
    
    if(inNames.size() == 0) {
        quit("no input files");
    }
    
    if(inNames.size() > 1 && objOut) {
        quit("cannot specify -o with -c with multiple files");
    }

    for(int i = 0; i < inNames.size(); i++) {
        
    }
}

void cleanup() {
    // Nothing to cleanup ATM
}
