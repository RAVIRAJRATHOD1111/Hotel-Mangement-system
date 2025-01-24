<?php

$hname = 'localhost';
$uname = 'root';
$pass = '';
$dbname = 'hotel';

$con = mysqli_connect($hname, $uname, $pass, $dbname);

if (!$con) {
    die("Connot connect to database" . mysqli_connect_error());
}

function filteration($data)
{
    foreach ($data as $key => $value) {
        $value = trim($value);
        $value = stripslashes($value);
        $value = strip_tags($value);
        $value = htmlspecialchars($value);
        $data[$key] = $value;
    }
    return $data;
}

function selectAll($table)
{
    $con = $GLOBALS['con'];
    $res = mysqli_query($con, "SELECT * FROM $table");
    return $res;
}


function select($sql, $value, $datatype)
{
    $con = $GLOBALS['con'];

    // Prepare the SQL statement
    if ($stmt = mysqli_prepare($con, $sql)) {

        // Ensure that $value is an array for correct unpacking
        if (!is_array($value)) {
            $value = [$value];  // Convert single value to an array
        }

        // Bind parameters to the prepared statement
        mysqli_stmt_bind_param($stmt, $datatype, ...$value);

        // Execute the statement
        if (mysqli_stmt_execute($stmt)) {
            $res = mysqli_stmt_get_result($stmt);
            mysqli_stmt_close($stmt);
            return $res;  // Return the result
        } else {
            mysqli_stmt_close($stmt);
            die("Query cannot be executed - Select");
        }
    } else {
        die("Query cannot be prepared - Select");
    }
}


// function select($sql, $value, $datatype)
// {
//     $con = $GLOBALS['con'];
//     if ($stmt = mysqli_prepare($con, $sql)) {
//         mysqli_stmt_bind_param($stmt, $datatype, ...$value);
//         if (mysqli_stmt_execute($stmt)) {
//             $res = mysqli_stmt_get_result($stmt);
//             mysqli_stmt_close($stmt);
//             return $res;
//         } else {
//             mysqli_stmt_close($stmt);
//             die("Query cannot be executed - Select");
//         }
//     } else {
//         die("Query cannot be prepared - Select");
//     }
// }

function update($sql, $value, $datatype)
{
    $con = $GLOBALS['con'];
    if ($stmt = mysqli_prepare($con, $sql))
     {
        mysqli_stmt_bind_param($stmt, $datatype, ...$value);
        if (mysqli_stmt_execute($stmt)) {
            $res = mysqli_stmt_affected_rows($stmt);
            mysqli_stmt_close($stmt);
            return $res;
        } else {
            mysqli_stmt_close($stmt);
            die("Query cannot be executed - update");
        }
    } else {
        die("Query cannot be prepared - update");
    }
}


function insert($sql, $value, $datatype)
{
    $con = $GLOBALS['con'];
    if ($stmt = mysqli_prepare($con, $sql)) {
        mysqli_stmt_bind_param($stmt, $datatype, ...$value);
        if (mysqli_stmt_execute($stmt)) {
            $res = mysqli_stmt_affected_rows($stmt);
            mysqli_stmt_close($stmt);
            return $res;
        } else {
            mysqli_stmt_close($stmt);
            die("Query cannot be executed - Insert");
        }
    } else {
        die("Query cannot be prepared - Insert");
    }
}

function delete($sql, $value, $datatype)
{
    $con = $GLOBALS['con'];
    if ($stmt = mysqli_prepare($con, $sql)) {
        mysqli_stmt_bind_param($stmt, $datatype, ...$value);
        if (mysqli_stmt_execute($stmt)) {
            $res = mysqli_stmt_affected_rows($stmt);
            mysqli_stmt_close($stmt);
            return $res;
        } else {
            mysqli_stmt_close($stmt);
            die("Query cannot be executed - Delete");
        }
    } else {
        die("Query cannot be prepared - Delete");
    }
}
?>