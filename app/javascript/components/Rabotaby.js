import React, {useState} from "react"

function RabotaBy(props) {
  return (
    <div>
      <label htmlFor="rabotaby_keyword">Ключевое слово</label>    
      <br/>
      <input type="text" id="rabotaby_keyword" name="criteria" />      
    </div>
  );
}

export default RabotaBy