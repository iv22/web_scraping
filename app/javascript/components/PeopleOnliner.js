import React, {useState} from "react"
import DatePicker from "react-datepicker"
import "react-datepicker/dist/react-datepicker.css"
import { registerLocale, setDefaultLocale } from  "react-datepicker";
import ru from 'date-fns/locale/ru';

function PeopleOnliner(props) {
  
  const [startDate, setStartDate] = useState(new Date())
  const [endDate, setEndDate] = useState(new Date())

  registerLocale('ru', ru)
  /* setDefaultLocale('ru'); */
  return (
    <div>
      <label> 
        Начало периода<br/>
        <DatePicker 
          name="start_date"
          dateFormat="dd/MM/yyyy"
          selected={startDate} 
          onChange={date => setStartDate(date)} 
          showMonthDropdown
          showYearDropdown
          locale="ru"
          dropdownMode="scroll" />
      </label>
      <br/>
      <label> 
        Конец периода (включительно)<br/>
        <DatePicker 
          name="end_date"
          dateFormat="dd/MM/yyyy"
          selected={endDate} 
          onChange={date => setEndDate(date)} 
          showMonthDropdown
          showYearDropdown
          locale="ru"
          dropdownMode="scroll" />
      </label>      
    </div>
  );
}

export default PeopleOnliner