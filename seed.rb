SiteCategory.create(name: "Provider")
SiteCategory.create(name: "Corporate")
SiteCategory.create(name: "School")
SiteCategory.create(name: "College")
SiteCategory.create(name: "Company")


Role.create(name: "CEO", site_category_id: 1)
Role.create(name: "Administrator", site_category_id: 1)
Role.create(name: "Chef", site_category_id: 1)
Role.create(name: "Nutrition", site_category_id: 1)
Role.create(name: "Audit Incharge", site_category_id: 1)
Role.create(name: "Dispatch Incharge", site_category_id: 1)


