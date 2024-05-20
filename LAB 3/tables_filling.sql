use Transport;

INSERT INTO depot (number) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO stop (name, x, y) VALUES
('Stop 1', 10, 20),
('Stop 2', 30, 40),
('Stop 3', 50, 60),
('Stop 4', 70, 80),
('Stop 5', 90, 100),
('Stop 6', 110, 120),
('Stop 7', 130, 140),
('Stop 8', 150, 160),
('Stop 9', 170, 180),
('Stop 10', 190, 200);

INSERT INTO route (number) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO transport (route_id, type, gov_num, brand, capacity, bus_num) VALUES
(1, 'Bus', '1234AB-1', 'Ã¿«', 50, 1001),
(2, 'Tram', '5678CD-2', 'Ã¿«', 40, 1002),
(3, 'Trolleybus', '9012EF-3', 'Ã¿«', 30, 1003),
(4, 'Electrobus', '3456GH-4', 'Ã¿«', 50, 1004),
(5, 'Bus', '7890IJ-5', 'Ã¿«', 40, 1005),
(6, 'Bus', '1234KL-6', 'Ã¿«', 30, 1006),
(7, 'Trolleybus', '5678MN-7', 'Ã¿«', 50, 1007),
(8, 'Electrobus', '9012OP-8', 'Mercedese', 40, 1008),
(9, 'Bus', '3456QR-9', 'Ã¿«', 30, 1009),
(10, 'Trolleybus', '7890ST-1', 'Ã¿«', 50, 1010);

INSERT INTO driver (transport_id, name, phone, categories) VALUES
(1, 'John Doe',   '+375333812055', 'AB'),
(2, 'Jane Smith', '+987654321098', 'ABC'),
(3, 'David Johnson', '+456789013456', 'AC'),
(4, 'Emily Davis', '+789012345789', 'ABCCE'),
(5, 'Michael Wilson', '+234568901234', 'ABBE'),
(6, 'Sophia Brown', '+890123567890', 'AC'),
(7, 'Daniel Taylor', '+567801234567', 'ABBECCED'),
(8, 'Olivia Clark', '+901245678901', 'ABD'),
(9, 'James Anderson', '+356789012345', 'AC'),
(10, 'Emma Martinez', '+789012345678', 'AC');

INSERT INTO depot_transport (depot_id, transport_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO route_stop (route_id, stop_id, stop_number) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 2),
(3, 5, 1),
(3, 6, 2),
(4, 7, 1),
(4, 8, 2),
(5, 9, 1),
(5, 10, 2);