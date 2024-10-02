import React from 'react'
import ToDoCard from './ToDoCard'

export default function ToDoList(props) {
    const {todos, handleDeleteTodo} = props

    
    return (
        <ul className='Main'>
        {todos.map((todo, todoIndex) => {
            return (
                <ToDoCard {...props} key = {todoIndex}
                index = {todoIndex}>
                    <p>{todo}</p>
                </ToDoCard>
            )
        })}
        </ul>
    )
    }
