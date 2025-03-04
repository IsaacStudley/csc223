# has_matching_tags

- What is parsing a string?

 From Wikipedia - Parsing, syntax analysis, or syntactic analysis is a process of analyzing a string of symbols, either in natural language, computer languages or data structures, conforming to the rules of a formal grammar by breaking it into parts. The term parsing comes from Latin pars (orationis), meaning part (of speech).

##

- What each part of the code does

```C++
#include <stack>
#include <string>
#include <iostream>

using namespace std;

int main() {
    string html_str = "<html><head><title>Website</title></head><body><h1>Big Website</h1><p>big website contest</p></body></html>";
    stack<string> st;

    int opening_index = 0;
    int closing_index = 0;
    for (int i = 0; i < html_str.length(); i++) {
        if (html_str[i] == '<') {
            opening_index = i;
        } else if (html_str[i] == '>') {
            closing_index = i;
            int slice_len = closing_index - opening_index;
            string slice = "";

            if (html_str[opening_index + 1] == '/') {
                slice = html_str.substr(opening_index + 2, slice_len - 2);
                if (slice != st.top()) {
                    cout << st.top() << " has no closing tag" << endl;
                    return 1;
                }
                st.pop();
                continue;
            }

            slice = html_str.substr(opening_index + 1, slice_len - 1);
            st.push(slice);
        }
    }

    cout << "valid html" << endl;
    return 0;
}
```

![](./stack-operations.webp)
