import Types "types";
import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor Assistant {
    type ToDo = Types.ToDo;

    var todos: [ToDo] = [];
    var nextId: Nat = 1;

    public query func getTodos(): async [ToDo] {
        return todos;
    };

    public func addTodo(description: Text): async () {
        let todo: ToDo = {
            id = nextId;
            description = description;
            completed = false;
        };

        todos := Array.append<ToDo>([todo], todos);

        nextId += 1;
    };

    public func completeTodo(id: Nat): async () {
        todos := Array.map<ToDo,ToDo>(todos, func (todo : ToDo) : ToDo {
            if (todo.id == id) {
                return {
                    id = todo.id;
                    description = todo.description;
                    completed = true;
                };
            };
            todo
        })
    };

    public query func showTodos(): async Text {
        var output: Text = "\n___TO-DOs___";
        for (todo: ToDo in todos.vals()) {
            output #= "\n(" # Nat.toText(todo.id) # ") " # todo.description;
            if (todo.completed) { output #= " ✔"; };
        };
        output
    };
};
