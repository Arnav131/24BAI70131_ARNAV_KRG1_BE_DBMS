DROP TABLE IF EXISTS Suppliers;

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL
);

INSERT INTO Suppliers (SupplierID, SupplierName, City) VALUES
(1, 'TechCorp', 'Delhi'),
(2, 'GlobalSupplies', 'Mumbai');

CREATE OR REPLACE PROCEDURE SwapSupplierCities(
    p_SupplierID1 INT, 
    p_SupplierID2 INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    v_City1 VARCHAR(100);
    v_City2 VARCHAR(100);
BEGIN
    SELECT City INTO v_City1 FROM Suppliers WHERE SupplierID = p_SupplierID1;
    SELECT City INTO v_City2 FROM Suppliers WHERE SupplierID = p_SupplierID2;

    UPDATE Suppliers SET City = v_City2 WHERE SupplierID = p_SupplierID1;
    UPDATE Suppliers SET City = v_City1 WHERE SupplierID = p_SupplierID2;

    COMMIT;
END;
$$;

SELECT * FROM Suppliers;

CALL SwapSupplierCities(1, 2);

SELECT * FROM Suppliers;