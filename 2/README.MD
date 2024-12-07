# Bioinformatics-2
## Домашнее задание 2

#### Последовательность
MDKGDVTALPMKKWFTTNYHYLVPEVEPSAEIKLNSTKPFDEFNEAKSLGVETKPVFIGPYTFLKLARTPEAAELEIDKGLVNAVAAVYAEVLARFNDLG

#### Программа для парного выравнивания
jCE-CP https://www.rcsb.org/alignment

#### Инструменты фолдинга белков
 * RoseTTAFold2 (https://colab.research.google.com/drive/18UDgXUqSphPaLYyJVcBRNzAQ1PHmtRvl)
 * OpenFold (https://colab.research.google.com/drive/1KFNDg54k3JBMKL8euV0wvzVdnCLj3W6X)

#### Полученные предсказания
 * OpenFold: ./prediction_openfold/openfold_prediction.pdb
 * RoseTTAFold2: ./prediction_RoseTTAFold2/RoseTTAFold2_pred.pdb

#### Логи и прочие файлы
 * Папка /debug

#### Выравнивание
 * sequence_alignment.fasta
 * https://www.rcsb.org/alignment?request-body=eJyVkcuO3CAQRf%2BFddN%2B9gPvZpMvmF00QhgKG8k8UuDMTFr97yl6RoqiLJKssO4tU%2BdebuzbDvjOphuLqbgYcv1EKDsGmYHMoEEaVRSbrNoy3A9Mx1DgrdRBHw2wiSXl8NVlYAfmoazRVC8oXz0NXCcykkISCuBjw6KS9OpNZveDhob28FBiguDCIulQWyGq04dO2yBkovvltEfyLKrFQyif11wPDH02sqwIeY0bYQxERGsom6wWm4QgxQWpk9wgLGWlJXcKlQvumlID4X29sR03Yl9LSXlqmj0D8j1tUZkj6jwfIy7N964x8TVUsbEwi4vtB97No%2BGjaS%2F8OgvBeyG62SgD%2Fck2GDM8Pz99IbBeJgRznLWzVI2N6BX1ybz%2FED6r%2B%2FOHZGayM2yg62PVJlV%2B99JRMvbEKMh%2Fo7daw3mcT7yD85WPQ0foeux52507pQdhQFya%2BjCWMP4J%2B%2FfhvyK%2F1Pqt2x7Nv9x%2FAsPi4Eo%3D&response-body=eJzVVclu20gU%2FJc%2Bk1Rv7EU3YkR5DFGKEBMcGEYgcGnKBLgoXJwYhv89r6l4yYIY8W2ki%2Fp1vXpLVUMPqGrLDi0f0DRVBVoiIaVPfGHckrPS5ZRJV3NG3MxPuZ9plWWEIwcNYzpOA%2BD%2F%2BbDdR2EcokcHNWZMLVVaV8e2Me14aLrCAOiUVv2XajCQ%2BOrOjLedLZkbNz%2FZ%2FN4MUz0C680DFOinfJwgNB%2Bnvgbk7TiehuViMQ2md6dT3aWF1%2BdD5nX9cXFHFkX3pbXBheTST7UsXcEodnkpCzdNiXF5ThmW3JisLBZ9N5g4DtZdXdDDqTeFl%2BVVCT2WXd%2BkI9RrmnOgGg5Z1ab9PVpCW8ZBbdrYuX5lOBWZ3Y6pTT5WXTtvY7hvDvNuA%2FT46Pz1LJmSJZE6d0ELmMAnzFUSBDIpI9RIIZkpFt3JgI518b45fsx%2Bc4ZPzos8h2dBZ516c4QUq9nNj1kOyszxMJjPc4Cdj1VbmK9oiR1Um%2FY43qKlVsD%2B%2FlTobOzTdjhP%2FtQJcfD3729%2FQUHscaoZ9gVRHGvha%2B242CNaSM0U00RixijnNqgU4b5iUlLJtKYaGCDqKwFW85kPckA6mZGYKgpBKinjVM4xggVYUyrA%2B1xoTs7pQgmJiY%2BpxoAUygFGQS0BEZhLIQi1MC4wwZRiogTxGZlrMw8zaJJiSTiMIKTjCg9Dw5z6BHPma185zCOMYPAKfBj0o2Bqq%2BLUNLMb4L3l3dNbu0vrycyrHe9P1h5D1VR12lfjvTvDkHVAC8q3B8ipiskc7AsfZg1md5jPk2nzn83xFAbK7WpzsUriINpvN5v%2F1nG8u%2F73Okr2YRLur4LwchPtruLNfr0K17sw2FxFF0kI52R9ebG%2FjtfRJgo%2BxvswCMIovASuKNkFSRAk10GYwNV6t4oukPPKju%2B2lH2x%2F8%2FG3xKYEuYp%2FQeVnWcoeUF9X4VbFSArgF%2FDsKfpM%2FLj9mr1BsdLyZ9Y2DM23r7tOXth%2F2lqUzxd2kEJhseN8dmPcyas54y3h7y7M316hCI3ENLqE1j38RujHS0B&encoded=true

#### Визуализация
 * Программа: По ссылке выше rcsb так же визуализирует парное выравнивание в двух цветах.

#### Раскраска
 * molstar-image.png

### Вывод

Обе программы для предсказания показали практически одинаковый результат. Выход RoseTTAFold2 имеет на 2 элемента в начале больше, чем у OpenFold. По сути цепочка OpenFold является подцепочкой RoseTTAFold2.

К тому же, стоит отметить, что OpenFold работал невероятно долго (~40 минут на всё), когда RoseTTAFold2 смогла выполнить предсказания за менее, чем 3 минуты.

Как можно увидеть на фото, структуры почти совпадают 1 в 1, хоть и в части отличаются в пространстве.

OpenFold так же выводит отчет об ошибка в предсказаниях, которое составляет 31.75 (файл ./prediction_openfold/predicted_aligned_error.json).