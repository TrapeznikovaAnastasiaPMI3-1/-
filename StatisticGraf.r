library(Cairo) #специальная библиотека для графиков
StatisticGraf < - function(rf, N) {
n <- 28 #мой вариант
number <- 300
#6. Исходные данные из упражнения 5
set.seed(n)
x <- rf(number, rf[1], rf[2]) #Закон распределения х
e <- rnorm(number, N[1], N[2]) #закон распределения е
y <- 5 + 2.5*x + e #модель связи х и у

#6.4. Сохранить рисунок в файл "plot-ex06.png"
CairoPNG('plot-ex06.png', 700, 700) # открываем файл в рабочей директории "plot-ex06.png"

#6.3. Разместить два построенных графика на одном полотне
par(mfrow = c(2,1)) #функция для размещения графиков друг под другом (2 строки и 1 столбец)

#6.1. Построить гистограмму СВ х, наложить теоретическую и фактическую плотности распределения
hist(x, freq = F, col = "grey", ylim = c(0,1) ) # cтроим гистограмму х, freq - частота, по вертикали откладываем вероятности
curve(df(x, 2, 112), col = "red", lwd = 2, add = T) #добавление плотности теоретического распределения с числовыми характеристиками как у х
lines(density(x),col = "darkgreen", lwd = 3) #Добавление плотности фактического распределения; lwd - толщина линии

#6.2. Построить гистограмму СВ y, наложить теоретическую и фактическую плотности распределения
#проделываем все то же самое, что для х
hist(y, freq = F, col = "grey")
curve(dnorm(x, mean = mean(y), sd = sd(y)), col = "darkgreen", lwd = 2, add = T) # dnorm(x!!!,mean,sd)
lines(density(y),col = "red", lwd = 3)

par(mfrow = c(1,1)) #возврат к обычному размещению перед сохранением

dev.off() #закрываем устройство графического вывода

#Найти межквартильную дисперсию
#Для начала извлечём межквартильные значения в новые переменные
#x
newx <- sort(x)
newx <- newx[(1/4*number + 1):(3/4*number)]
#y
newy <- sort(y)
newy <- newy[(1/4*number + 1):(3/4*number)]
#теперь найдём дисперсию по формуле
#x
xmean <- sum(newx)/length(newx)
newx2 <- newx^2
Dx <- sum(newx2)/length(newx) - xmean^2
#y
ymean <- sum(newy)/length(newy)
newy2 <- newy^2
Dy <- sum(newy2)/length(newy) - ymean^2
#Построим фрейм с данными
dfDisperssion <- data.frame(Name = c("x", "y"), D = c(Dx, Dy))
dfDisperssion
}

#проверка (исправленной!!!) дисперсии:
#var(newx)
#var(newy)





