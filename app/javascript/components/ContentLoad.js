import React, {useState} from "react"
import PeopleOnliner from "./PeopleOnliner"
import RabotaBy from "./Rabotaby"

function ContentLoad(props) {
  
  const formSubmit = (event) => {
    event.preventDefault();
    console.log("SUBMIT")
  }

  const onValueChange = (event) => {
    console.log("ON_CHANGE")
  }

  return (
    <div>
      <form onSubmit={formSubmit}>
        <div>
          <input type="radio" id="onliner" name="source" value="onliner" 
            onChange={onValueChange}/>
          <label htmlFor="onliner">Новости Onliner</label>
          <PeopleOnliner />
        </div>
        <div>
          <input type="radio" id="rabotaby" name="source" value="rabotaby" 
            onChange={onValueChange} />
          <label htmlFor="rabotaby">Вакансии RabotaBy</label>
          <RabotaBy />
        </div>
        <input type='submit' value='Собрать данные' />
      </form>        
    </div>
  );
}

export default ContentLoad