// import { useState } from "react"
// import ToDoInput from "./components/ToDoInput"
// import ToDoList from "./components/ToDoList"

// function App() {
 
//   const [todos, setTodos] = useState([
//     "go to the gym", 
//     "Eat more fruits and Veg",
//     "Pick up mail"
//   ])

//   function handleAddTodos(newTodo) {
//     const newTodoList = [...todos, newTodo]
//     setTodos(newTodoList)
//   }
  // function handleDeleteTodo(index){
  //   const newTodoList = todos.filter((todo,todoIndex)=> {
  //     return todoIndex != index
  //   })
  //   setTodos(newTodoList)
  // }

//   return (
//     <>
//       <ToDoInput handleAddTodos = {handleAddTodos}/>
//       <ToDoList todos={todos}/>
//     </>
//   )
// }

// export default App
import { useState, useEffect } from "react";
import ToDoInput from "./components/ToDoInput";
import ToDoList from "./components/ToDoList";

function App() {
  const [todos, setTodos] = useState([]);
  const [todoValue, setTodoValue] = useState('')

  function persistData(newList) {
    localStorage.setItem('todos', JSON.stringify({todos:newList}))
  }
  function handleAddTodos(newTodo) {
    if (newTodo.trim()) {  // Prevent adding empty todos
      const newTodoList = [...todos, newTodo];
      persistData(newTodoList)
      setTodos(newTodoList);
    }
  }
  function handleDeleteTodo(index) {
    if (index >= 0 && index < todos.length) { // Ensure the index is valid
      const newTodoList = todos.filter((_, todoIndex) => todoIndex !== index);
      persistData(newTodoList)
      setTodos(newTodoList);
    }
  }

  function handleEditTodo(index){
    const valueToBeEdited = todos[index]
    setTodoValue(valueToBeEdited)
    handleDeleteTodo(index)
  }
  useEffect(() => {
    let localTodos = localStorage.getItem('todos');
    if (!localTodos) {
      return;
    }
    localTodos = JSON.parse(localTodos).todos;
    setTodos(localTodos);
}, []);
  // useEffect(() => {
  //   if (!localTodos) {
  //     return
  //   }
  //   let localTodos = localStorage.getItem('todos')
  //   if (!localTodos){
  //     return
  //   }
  //   localTodos = JSON.parse(localTodos).todos
  //   setTodos(localTodos)
  // },[])

  return (
    <>
      <ToDoInput todoValue= {todoValue} setTodoValue = {setTodoValue} handleAddTodos={handleAddTodos} />
      <ToDoList handleEditTodo = {handleEditTodo} handleDeleteTodo = {handleDeleteTodo} todos={todos} />
    </>
  );
}

export default App;

