for dir in lib/logic/blocs/*/; do
  name=$(basename "$dir")
  for suffix in bloc event state; do
    file="${dir}${name}_${suffix}.dart"
    [ -e "$file" ] || touch "$file"
  done
  echo "Vérifié $name/"
done
