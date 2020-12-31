import React, {useState} from "react"

function RabotaBy(props) {
  return (
    <React.Fragment>
      <div className="col-1"></div>
      <div className="col-3">
        <label htmlFor="rabotaby_keyword">Ключевое слово</label>    
        <br/>
        <input type="text" id="rabotaby_keyword" name="criteria" />
      </div>      
    </React.Fragment>
  );
}

export default RabotaBy