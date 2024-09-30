import { useEffect, useState } from 'react';
import './App.css';
import axios from 'axios';

function App() {

  //사용자 상태
  const [userData, setUserData] = useState({
    name: '',
    age: '',
    gender: ''
  });

  //백엔드와 통신
  useEffect(()=>{
    axios.get('http://api.test.com')
        .then(res=>setUserData({name:res.data.name, age:res.data.age, gender:res.data.gender}))
        .catch(err=>console.error(err))
  },[])

  return (
    <div className="App">
      <h1>이름: {userData.name}</h1>
      <h1>나이: {userData.age}</h1>
      <h1>성별: {userData.gender}</h1>
    </div>
  );
}

export default App;



