#include <string>
using namespace std;

struct Node {
    int cargo;
    Node* next;
    // constructors
    Node();
    Node(int);
    Node(int, Node*);

    // member functions
    string to_string();
};
    string render_list(Node*);
    string render_list_backward(Node*);
    string render_pretty(Node*, string(*ren)(Node*));

    Node* remove_second(Node*);
