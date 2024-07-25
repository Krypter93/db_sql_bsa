import mysql from 'mysql2/promise';

// Create connection to DB
const connectionToDatabase = async () => {
    try {
        const connection = await mysql.createConnection({
            host: 'localhost',
            user: 'dbmanager',
            password: 'Dbmanager123*',
            database: 'MoviesDB'
        })

        console.log('Connected to DB')
        return connection
    } catch (error) {
        console.log(`Error connecting to DB: ${error}`)
}
}

connectionToDatabase()

/* Test query */
const runQuery = async () => {
    try {
        const connection = await connectionToDatabase()

        const [rows] = await connection.execute('SELECT 1 + 1 AS solution');
        console.log(`Results: ${rows[0].solution}`);

        await connection.end();
    } catch (error) {
        console.log(`Error executing query: ${error}`)
    }
}

runQuery()

