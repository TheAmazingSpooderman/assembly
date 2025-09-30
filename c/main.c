#include <stdio.h>
#include <stdbool.h>

static int str_len(char s[]) {
    int len = 0;
    while (s[len] != '\0') {
        len++;
    }
    return len;
}

static bool is_palindrome(char s[]) {
    int i = 0;
    int j = str_len(s) - 1;
    while (i < j) {
        if (s[i] != s[j]) return false;
        i++;
        j--;
    }
    return true;
}

int main (void) {
    char s[] = "paul";
    bool palindrom = is_palindrome(s);

    printf("%d\n", is_palindrome(s));

    return 0;
}