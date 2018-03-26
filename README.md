# Google-s-page-rank
implement a toy version of Google's world renowned PageRank algo- rithm.


(a)         		  		         	  URL                                       X    
 				 __________________________________________________           ________
           'http://www.harvard.edu'                                   [0.7928]
           
           'http://www.hbs.edu'                                       [0.1550]
           
 					 'http://search.harvard.edu:8765/custom/query.html'         [0.1547]
       
 					 'http://www.med.harvard.edu'                               [0.1537]
       
 					 'http://www.gse.harvard.edu'                               [0.1300]
       
(b)
Yea, the plot does match with what I expected and the plot is shown below (in part c). A is 500*500 matrix and x is 500*1 matrix before the inner loop starts. The result of A*x will always be a 500*1 matrix which is the updated x. I calculated the operation time for calculating the first row of the result matrix is : 500(multiply)+499(plus)=999 operation time. There are 500 rows need this operation. Then, the total operation count for one time A*x is 500*999=249,500. The inner loop will run k times based one the for loop code. After the inner loop finished, the total operation count is equal to the value of k times operation count of A*x which is 249,500k which is a positive linear relationship. Variable k is increasing when the outer loop is activated but the relationship between k and operation count remains same which is 249,500k. Sine tic_toc time has positive linear relationship with total operation count, the tic_toc time also depends on the value of k. When k increases, time increases as well.
(c)    
     
The running time still has positive linear relationship with k value which means operation count still depends on k value. From the diagram, taking advantage of the sparsity of G and D results less operation time than before but the relationship between k value and operation count remains same since the slope is similar. In addition, the plot of part c and part b changes slightly every time I try to plot them out. I think the operation time is also related with the computer’s processor, memory etc. 
