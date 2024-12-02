-- Table structure for `plants`
-- Creating table with columns for plant details
DROP TABLE IF EXISTS `plants`;
CREATE TABLE `plants` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,  -- Plant identifier
  `name` VARCHAR(255) NOT NULL,  -- Plant common name
  `scientific_name` VARCHAR(255) DEFAULT NULL,  -- Scientific name of the plant
  `care_instructions` TEXT DEFAULT NULL,  -- Care instructions
  `growing_conditions` TEXT DEFAULT NULL,  -- Growing conditions
  `pests_diseases` TEXT DEFAULT NULL,  -- Known pests or diseases
  `image_url` VARCHAR(255) DEFAULT NULL,  -- Image URL
  `harvesting_info` TEXT DEFAULT NULL,  -- Harvesting information
  `seasonality` VARCHAR(50) DEFAULT NULL,  -- Seasons of growth
  `growth_habit` VARCHAR(50) DEFAULT NULL,  -- Growth habit (e.g., tree, vine)
  `nutritional_info` TEXT DEFAULT NULL,  -- Nutritional info
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data insertion into `plants`
-- Inserting sample plant data
LOCK TABLES `plants` WRITE;
INSERT INTO `plants` 
    (`id`, `name`, `scientific_name`, `care_instructions`, `growing_conditions`, `pests_diseases`, `image_url`, `harvesting_info`, `seasonality`, `growth_habit`, `nutritional_info`) 
VALUES 
    (1, 'Apple', 'Malus domestica', 'Water regularly, prune in spring, and ensure proper air circulation.', 
     'Full sun, well-drained soil, with a pH of 6.0 to 6.8.', 'Aphids, apple maggots, fire blight.',
     'https://png.pngtree.com/background/20230424/original/pngtree-an-apple-tree-has-lots-of-red-fruit-in-it-picture-image_2455670.jpg', 
     'Harvest in September.', 'Spring, Summer, Fall', 'Tree', 'Rich in fiber and vitamin C.'),
    (2, 'Blueberry', 'Vaccinium corymbosum', 'Requires acidic soil (pH 4.5 to 5.5), and regular watering.',
     'Full sun, well-drained, acidic soil.', 'Blueberry maggot, birds, root rot.',
     'https://th.bing.com/th/id/OIP.zk3TmkJcun57Ibon15WabAHaFj?rs=1&pid=ImgDetMain',
     'Harvest when berries are fully blue.', 'Summer', 'Shrub', 'High in antioxidants and vitamin C.'),
    (3, 'Cherry', 'Prunus avium', 'Requires regular watering and pruning in winter.',
     'Full sun, well-drained soil, with a pH of 6.0 to 7.0.', 'Cherry slug, aphids, black cherry aphid.',
     'https://th.bing.com/th/id/OIP.Wj7ayHq1wqNSJ5RbStzy6wHaFj?rs=1&pid=ImgDetMain',
     'Harvest when cherries are ripe and dark red.', 'Spring, Summer', 'Tree', 'High in vitamin C and antioxidants.'),
    (4, 'Corn', 'Zea mays', 'Requires full sun and regular watering during growing season.',
     'Well-drained soil with a pH of 5.8 to 7.0.', 'Corn borers, aphids, earworms.',
     'https://th.bing.com/th/id/OIP.-w4IHX6a6l_xTxgx-CX9HgHaFj?rs=1&pid=ImgDetMain',
     'Harvest when kernels are plump and golden yellow.', 'Summer', 'Annual', 'High in carbohydrates and fiber.'),
    (5, 'Grape', 'Vitis vinifera', 'Requires support such as a trellis and regular pruning.',
     'Full sun, well-drained soil with a pH of 5.5 to 6.5.', 'Grape berry moth, aphids, powdery mildew.',
     'https://th.bing.com/th/id/OIP.v39BKwz5EKFse4gTkNc_zAHaFj?rs=1&pid=ImgDetMain',
     'Harvest when grapes are fully ripened.', 'Summer, Fall', 'Vine', 'Rich in antioxidants, vitamin C, and potassium.'),
    (6, 'Orange', 'Citrus sinensis', 'Requires full sun and regular watering, especially during dry periods.',
     'Well-drained soil with a pH of 6.0 to 7.0.', 'Citrus aphids, scale insects, root rot.',
     'https://th.bing.com/th/id/OIP.GhZW3f76cG_diyHpXcbN2wHaFj?rs=1&pid=ImgDetMain',
     'Harvest when the skin is orange and the fruit is firm.', 'Winter, Spring', 'Tree', 'High in vitamin C and fiber.'),
    (7, 'Peach', 'Prunus persica', 'Requires regular watering and pruning in early spring.',
     'Full sun, well-drained soil, with a pH of 6.0 to 7.0.', 'Peach twig borer, aphids, leaf curl.',
     'https://th.bing.com/th/id/OIP.UM2h5ptKtjGpF0V2EfwopQHaFj?rs=1&pid=ImgDetMain',
     'Harvest when peaches are firm and fully colored.', 'Spring, Summer', 'Tree', 'High in vitamins A and C, and fiber.'),
    (8, 'Pepper', 'Capsicum annuum', 'Requires regular watering and well-drained soil.',
     'Full sun, well-drained, fertile soil with a pH of 6.0 to 7.0.', 'Aphids, pepper maggot, aphid-transmitted viruses.',
     'https://th.bing.com/th/id/OIP.Ey-QlXXuBx70D-xcSoGRgAHaFj?rs=1&pid=ImgDetMain',
     'Harvest when peppers are firm and fully colored.', 'Summer, Fall', 'Plant', 'Rich in vitamin C and antioxidants.'),
    (9, 'Potato', 'Solanum tuberosum', 'Requires well-drained, loose soil and regular watering.',
     'Full sun, well-drained soil with a pH of 5.5 to 6.5.', 'Potato beetles, aphids, blight.',
     'https://th.bing.com/th/id/OIP.VfAx6PglstEdZj1yTSGrzAHaFj?rs=1&pid=ImgDetMain',
     'Harvest when potato skins are firm and the plant wilts.', 'Spring, Summer', 'Root vegetable', 'High in carbohydrates and potassium.'),
    (10, 'Tomato', 'Solanum lycopersicum', 'Requires regular watering and staking for support.',
     'Full sun, well-drained soil with a pH of 6.0 to 6.8.', 'Tomato hornworm, aphids, early blight.',
     'https://th.bing.com/th/id/OIP.lBhA9Eq2rAvvWq7umRpZCgHaFj?rs=1&pid=ImgDetMain',
     'Harvest when tomatoes are fully ripe and red.', 'Summer, Fall', 'Plant', 'Rich in vitamins A and C, and lycopene.');
LOCK TABLES `plants` WRITE;

-- End of dump
