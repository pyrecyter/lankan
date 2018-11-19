function allnumeric(Price)
   {
      var numbers = /^[0-9]+$/;
      if(Price.value.match(numbers))
      {
      
      return true;
      }
      else
      {
      alert('Please input numeric characters only');
      
      return false;
      }
   } 