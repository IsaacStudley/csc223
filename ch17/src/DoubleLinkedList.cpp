#include "DoubleLinkedList.h"
using namespace std;
#include <string>

Node::Node()
{
    cargo = 0;
    next = nullptr;
}


Node::Node(int c)
{
    cargo = c;
    prev = next = nullptr;   
}

Node::Node(int cargo, Node* next)
{
    this->cargo = cargo;
    this->next = next;
}

string Node::to_string() {
    return std::to_string(cargo);
}

string render_list(Node* node) {
    string result = node->to_string();
    while (node->next != nullptr) {
        node = node->next;
        result += (", " + node->to_string());
    }
    return result;
}

string render_list_backward(Node* node) {
    string result = node->to_string();
    while (node->next != nullptr) {
        node = node->next;
        result = (node->to_string() + ", " + result);
    }
    return result;
}

string render_pretty(Node* node, string(*ren)(Node*)) {
    return "("+ ren(node) +")";
}

Node* remove_second(Node* list) {
    Node* first = list;
    Node* second = list->next;

    // make the first node point to the third
    first->next = second->next;

    // remove the second node from the list and return a pointer to it
    second->next = nullptr;
    return second;
}