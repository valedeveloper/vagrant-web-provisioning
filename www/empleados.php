<?php
$host = '192.168.56.11'; // IP de la VM db
$db   = 'empresa';
$user = 'webuser';
$pass = 'webpass123';

$conn = pg_connect("host=$host dbname=$db user=$user password=$pass");
if (!$conn) { die("Error al conectar a PostgreSQL"); }

$res = pg_query($conn, "SELECT id, nombre, cargo FROM empleados ORDER BY id");
if (!$res) { die("Error en la consulta"); }

echo "<h1>Empleados</h1>";
echo "<table border='1' cellpadding='6'><tr><th>ID</th><th>Nombre</th><th>Cargo</th></tr>";
while ($row = pg_fetch_assoc($res)) {
    echo "<tr><td>{$row['id']}</td><td>{$row['nombre']}</td><td>{$row['cargo']}</td></tr>";
}
echo "</table>";

pg_close($conn);
