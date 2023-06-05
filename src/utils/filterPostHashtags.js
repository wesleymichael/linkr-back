export default function filterPostHashtags(postDescription) {
  return postDescription
    .match(/#[a-záàâãéèêíïóôõöúçñ\d-]+/gi)
    ?.filter((value, index, array) => array.indexOf(value) === index)
    .map((v) => v.replace("#", ""));
}
