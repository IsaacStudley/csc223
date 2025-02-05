#include "LinkedList.h"
using namespace std;
#include <string>

Node::Node()
{
    cargo = 0;
    next = nullptr;
}

Node::Node(int cargo)
{
    this->cargo = cargo;
    next = nullptr;
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

Node* remove_second(Node* node) {
    Node* node2 = node->next;
    node->next = node->next->next;
    node2->next = nullptr;
    return node;
}