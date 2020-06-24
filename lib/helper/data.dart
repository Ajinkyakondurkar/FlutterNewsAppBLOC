import 'package:newsfeedapp/model/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> categoryList=new List<CategoryModel>();
  CategoryModel categoryModel;

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Business";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80";
  categoryList.add(categoryModel);

  //2
  categoryModel=new CategoryModel();
  categoryModel.categoryName="Entertainment";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1525869811964-53594bfcb4b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  categoryList.add(categoryModel);

  //3
  categoryModel=new CategoryModel();
  categoryModel.categoryName="General";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1455849318743-b2233052fcff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categoryList.add(categoryModel);

  //4
  categoryModel=new CategoryModel();
  categoryModel.categoryName="Health";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1477332552946-cfb384aeaf1c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categoryList.add(categoryModel);

  //5
  categoryModel=new CategoryModel();
  categoryModel.categoryName="Science";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categoryList.add(categoryModel);

  //5
  categoryModel=new CategoryModel();
  categoryModel.categoryName="Sports";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1517649763962-0c623066013b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categoryList.add(categoryModel);

  //5
  categoryModel=new CategoryModel();
  categoryModel.categoryName="Technology";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categoryList.add(categoryModel);

  return categoryList;
}