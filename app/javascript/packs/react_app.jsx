import React from 'react'
import ReactDOM from 'react-dom'

const Welcome = () => (
  <h1>Welcome to Video Viewer</h1>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Welcome />,
    document.getElementById('root')
  )
})
