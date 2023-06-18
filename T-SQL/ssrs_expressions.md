# Expressions  

### add data requires context 

=Sum(Fields!Cost.Value, "<DataSet>")

### Sum by filtered field group by different column

```
=(Sum(IIF(Fields!Cost_Center.Value = "Non1010", Fields!Net_Amount.Value, nothing)))
```

### Switch cell bg color based on value

```
=Switch(CInt(Fields!Column.Value) = 5 , "#D9B84D",
CInt(Fields!Column.Value) >= 4.0 , "#00B050",
CInt(Fields!Column.Value) >= 3.0, "#FFFF66",
CInt(Fields!Column.Value) >= 2.0, "#FF5050",
CInt(Fields!Column.Value) >= 1.0, "#FF5050")
```
### Using `IsError` to capture convert errors

```
=IIf(IsError(CDate(Fields!<ToConvert>.Value)),Fields!<ToConvert>.Value, Fields!<A Different Value>.Value)
```

## Get month as int

```
=Month(Today())
```

## Get month name
```
=MonthName(Month(Today()), False)
```
### Get year
```
Year(Today())
```
