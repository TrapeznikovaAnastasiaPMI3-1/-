#Упражнение 4
#4.1 Загружаем с помощью функции data() набор данных ...
data(JohnsonJohnson)
#4.2 Вызываем справку по набору...
?JohnsonJohnson
#4.3 Изучаем структуру фрейма...
str(JohnsonJohnson)
#4.4
#вывод первых пять строк в консоль
head(JohnsonJohnson, n = 5)
#вывод последних пяти строк в консоль
tail(JohnsonJohnson,n = 5 )
#описательные статистики по фрейму
summary(JohnsonJohnson)
#4.5 Создаем вектор с именами столбцов...
p <- colnames(JohnsonJohnson)
#4.6 Оставляем во фрейме только столбцы с количественными показателями
# is.numeric - проверка на счетные данные
JohnsonJohnson[,sapply(JohnsonJohnson, is.numeric)]
#4.7 Рассчитываем коэффициенты вариации и среднее квартильное расстояние по каждому столбцу фрейма
#sd -среднеквадратичное, mean - среднее
sapply(JohnsonJohnson,sd)/sapply(JohnsonJohnson,mean)
sapply(JohnsonJohnson, IQR)/2
