<?php
$link = mysql_connect('localhost', 'root', '123456','task');
if (!$link) {
  die('Could not connect: ' . mysql_error());
}
mysql_select_db('task');

?>
<!DOCTYPE html>
<html>
<head>
  <style>
  table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }

  td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
  }

  tr:nth-child(even) {
    background-color: #dddddd;
  }
  </style>
</head>
<body>

  <h2>EXAM Table</h2>
  <table>
    <tr>
      <th>Student Name</th>
      <th>Exam 1</th>
      <th>Exam 2</th>
      <th>Exam 3</th>
      <th>Total</th>
      <th>Result</th>
    </tr>
    <?php

    $retval = mysql_query("SELECT * FROM `exam`");
    if (!$retval) {
      echo 'Could not run query: ' . mysql_error();
      exit;
    }

    while($row = mysql_fetch_array($retval, MYSQL_ASSOC)) {
        $exam_1=$row['exam_1'];
        $exam_2=$row['exam_2'];
        $exam_3=$row['exam_3'];
      ?>
      <tr>
        <td><?php echo $row[student_name];?></td>
        <td><?php echo $exam_1;?></td>
        <td><?php echo $exam_2;?></td>
        <td><?php echo $exam_3;?></td>
        <td>
          <?php
              $total=$exam_1+$exam_2+$exam_3;
              echo $total;
            ?>
        </td>
        <td>
          <?php
            $result=FALSE;
            $exam_12=$exam_1+$exam_2;

            if($exam_1 < 18)
            {
              //In exam 1 and 2 minimum 18 marks require per exam to pass
              $result=FALSE;
            }
            elseif ($exam_2 < 18) {
              //In exam 1 and 2 minimum 18 marks require per exam to pass
              $result=FALSE;
            }elseif ($exam_12 < 40) {
              //total of first 2 exam minimum 40 Mark require to Pass
              $result=FALSE;
            }
            elseif ($exam_3 < 40) {
              //In 3rd exam minimum require mark to pass is 40
              $result=FALSE;
            }
            elseif ($total < 90) {
              //total of all 3 exams marks should be 90
              $result=FALSE;
            }
            else{
              $result=TRUE;
            }

            echo empty($result)?'FAIL':'PASS';

          ?>
        </td>
      </tr>
      <?php
    }
    ?>
  </table>

</body>
</html>
<?php
mysql_close($link);

?>
