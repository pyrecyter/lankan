function allLetter(Name,Mobile)
      { 
      var letters = /^[A-Za-z]+$/;
      if(Name.value.match(letters))
      {
    	  var numbers = /^[0-9]+$/;
      
    	   if(Mobile.value.match(numbers))
    	   {
    		   var phoneno = /^\d{10}$/;
    	   
    		   if((Mobile.value.match(phoneno))){
    		 return true;
    		   }
    		   else
    			   alert("please input letters only");
    	   }
    		   else
    			   alert("please input 10 numbers");
    	   }
    		   else
    			   alert("Please input  Valid Fiel ds");
    	   return false;
    		   }
    		   
      

    	   
      
      
   
    

